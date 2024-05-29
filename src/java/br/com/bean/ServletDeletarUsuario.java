/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package br.com.bean;

import br.com.controle.Aluno;
import br.com.entidade.CadastroUsuarioDAO;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author victo
 */
@WebServlet(name = "ServletDeletarUsuario", urlPatterns = {"/ServletDeletarUsuario"})
public class ServletDeletarUsuario extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try {
            int matricula = Integer.parseInt(request.getParameter("matricula"));
            CadastroUsuarioDAO dao = new CadastroUsuarioDAO();
            Aluno aluno = dao.getUsuarioByMatricula(matricula);
            String msg;

            if (aluno != null) {
                if (dao.deletar(aluno)) {
                    msg = "Usuário deletado com sucesso.";
                    request.getSession().setAttribute("delecaoSucesso", true); // Definir atributo de sessão para deletar com sucesso
                } else {
                    msg = "Erro ao deletar usuário.";
                }
            } else {
                msg = "Usuário não encontrado.";
                request.setAttribute("msgResposta", msg); // Adicione esta linha para enviar a mensagem de erro para a página
                RequestDispatcher enviar = request.getRequestDispatcher("erro.jsp"); // Redirecionar para a página de erro
                enviar.forward(request, response);
                return; // Adicione esta linha para sair do método após redirecionar
            }

            request.setAttribute("msgResposta", msg);
            RequestDispatcher enviar = request.getRequestDispatcher("sessoes/adm/crudUsuario/alterarDadosUsuarios.jsp");
            enviar.forward(request, response);

        } catch (NumberFormatException e) {
            String msg = "Matrícula inválida.";
            request.setAttribute("msgResposta", msg);
            RequestDispatcher enviar = request.getRequestDispatcher("sessoes/adm/crudUsuario/alterarDadosUsuarios.jsp");
            enviar.forward(request, response);
        } catch (Exception e) {
            String msg = "Erro ao deletar usuário.";
            request.setAttribute("msgResposta", msg);
            RequestDispatcher enviar = request.getRequestDispatcher("sessoes/adm/crudUsuario/alterarDadosUsuarios.jsp");
            enviar.forward(request, response);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
