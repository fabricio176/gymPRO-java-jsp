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
            // Recebe a matrícula do parâmetro da requisição GET
            int matricula = Integer.parseInt(request.getParameter("matricula"));
            Aluno usuario = new Aluno();
            try {
                CadastroUsuarioDAO dao = new CadastroUsuarioDAO();
                // Recupera os dados do usuário com base na matrícula
                usuario = dao.pesquisar(matricula);
            } catch (Exception e) {
                e.printStackTrace();
                // Se houver algum erro na recuperação dos dados, redirecione para uma página de erro
                response.sendRedirect("erro.jsp");
                return;
            }

            if (usuario == null) {
                String msg = "Não foram encontrados registros.";
                request.setAttribute("msgResposta", msg);
                RequestDispatcher enviar = request.getRequestDispatcher("sessoes/adm/listaUsuarios.jsp");
                enviar.forward(request, response);
            } else {
                // Se o usuário for encontrado, envie os dados para a página de edição
                request.setAttribute("usuario", usuario);
                RequestDispatcher lista = request.getRequestDispatcher("sessoes/adm/crudUsuario/editarUsuario.jsp");
                lista.forward(request, response);
            }
        } catch (NumberFormatException e) {
            String msg = "Matrícula inválida.";
            request.setAttribute("msgResposta", msg);
            RequestDispatcher enviar = request.getRequestDispatcher("sessoes/adm/listaUsuarios.jsp");
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