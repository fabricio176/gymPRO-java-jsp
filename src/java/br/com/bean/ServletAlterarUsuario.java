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
            try {
            int matricula = Integer.parseInt(request.getParameter("matricula"));
            CadastroUsuarioDAO dao = new CadastroUsuarioDAO();
            Aluno usuario = null;
            try {
                usuario = dao.getUsuarioByMatricula(matricula);
            } catch (Exception e) {
                e.printStackTrace();
                response.sendRedirect("erro.jsp");
                return;
            }

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
        return "Short description";
    }
}