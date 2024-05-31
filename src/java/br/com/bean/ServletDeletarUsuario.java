package br.com.bean;

import br.com.controle.Aluno;
import br.com.entidade.CadastroUsuarioDAO;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(name = "ServletDeletarUsuario", urlPatterns = {"/ServletDeletarUsuario"})
public class ServletDeletarUsuario extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String msg;
        try {
            int matricula = Integer.parseInt(request.getParameter("matricula"));
            CadastroUsuarioDAO dao = new CadastroUsuarioDAO();
            Aluno aluno = dao.getUsuarioByMatricula(matricula);

            if (aluno != null) {
                if (dao.deletar(aluno)) {
                    msg = "Usuário deletado com sucesso.";
                    request.getSession().setAttribute("delecaoSucesso", true);
                } else {
                    msg = "Erro ao deletar usuário.";
                }
            } else {
                msg = "Usuário não encontrado.";
            }

            request.setAttribute("msgResposta", msg);
            RequestDispatcher enviar = request.getRequestDispatcher("sessoes/adm/crudUsuario/alterarDadosUsuarios.jsp");
            enviar.forward(request, response);

        } catch (NumberFormatException e) {
            msg = "Matrícula inválida.";
            request.setAttribute("msgResposta", msg);
            RequestDispatcher enviar = request.getRequestDispatcher("sessoes/adm/crudUsuario/alterarDadosUsuarios.jsp");
            enviar.forward(request, response);
        } catch (Exception e) {
            msg = "Erro ao deletar usuário.";
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
