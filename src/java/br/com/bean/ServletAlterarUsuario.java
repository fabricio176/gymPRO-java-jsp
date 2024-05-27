package br.com.bean;

import br.com.controle.Aluno;
import br.com.entidade.CadastroUsuarioDAO;
import java.io.IOException;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(name = "ServletAlterarUsuario", urlPatterns = {"/ServletAlterarUsuario"})
public class ServletAlterarUsuario extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        String method = request.getMethod();
        if (method.equals("POST")) {
            handlePostRequest(request, response);
        } else {
            handleGetRequest(request, response);
        }
    }

    private void handleGetRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            int matricula = Integer.parseInt(request.getParameter("matricula"));
            CadastroUsuarioDAO dao = new CadastroUsuarioDAO();
            Aluno usuario = dao.getUsuarioByMatricula(matricula);

            if (usuario == null) {
                String msg = "Não foram encontrados registros.";
                request.setAttribute("msgResposta", msg);
                RequestDispatcher enviar = request.getRequestDispatcher("sessoes/adm/crudUsuario/alterarDadosUsuarios.jsp");
                enviar.forward(request, response);
            } else {
                request.setAttribute("usuario", usuario);
                RequestDispatcher lista = request.getRequestDispatcher("sessoes/adm/crudUsuario/alterarDadosUsuarios.jsp");
                lista.forward(request, response);
            }
        } catch (NumberFormatException e) {
            String msg = "Matrícula inválida.";
            request.setAttribute("msgResposta", msg);
            RequestDispatcher enviar = request.getRequestDispatcher("sessoes/adm/crudUsuario/alterarDadosUsuarios.jsp");
            enviar.forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("erro.jsp");
        }
    }

    private void handlePostRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            int matricula = Integer.parseInt(request.getParameter("matricula"));
            String nome = request.getParameter("nome");
            String senha = request.getParameter("senha");
            String cpf = request.getParameter("cpf");
            String endereco = request.getParameter("endereco");
            String telefone = request.getParameter("telefone");

            CadastroUsuarioDAO dao = new CadastroUsuarioDAO();
            Aluno usuario = new Aluno(matricula, nome, senha, cpf, endereco, telefone);
            dao.atualizarUsuario(usuario);

            response.sendRedirect(request.getContextPath() + "/sessoes/adm/crudUsuario/alterarDadosUsuarios.jsp?sucess=true");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("erro.jsp");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Servlet para alterar dados de usuários";
    }
}
