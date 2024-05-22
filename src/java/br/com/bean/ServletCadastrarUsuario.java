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
import java.util.ArrayList;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author victo
 */
@WebServlet(name = "ServletCadastrarUsuario", urlPatterns = {"/ServletCadastrarUsuario"})
public class ServletCadastrarUsuario extends HttpServlet {

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
            throws ServletException, IOException, Exception {
        response.setContentType("text/html;charset=UTF-8");
        try {
            String cpf = request.getParameter("cpfCadastro");
            CadastroUsuarioDAO dao = new CadastroUsuarioDAO();
    
            String nome = request.getParameter("nome");
            String senha = request.getParameter("senhaCadastro");
            String endereco = request.getParameter("endereco");
            String telefone = request.getParameter("telefone");

            Aluno a = new Aluno();
            a.setNome(nome);
            a.setSenha(senha);
            a.setCpf(cpf);
            a.setEndereco(endereco);
            a.setTelefone(telefone);

            dao.inserir(a);

            // Armazena o CPF do usuário na sessão
            request.getSession().setAttribute("cpfUsuarioLogado", cpf);

            // Encaminha o nome do usuário para a sessãoUsuario.jsp
            request.setAttribute("nomeUsuario", nome);     

            // Encaminha para a sessaoUsuario.jsp
            RequestDispatcher rd = request.getRequestDispatcher("sessoes/usuario/sessaoUsuario.jsp");
            rd.forward(request, response);
            

            

        } catch (Exception e) {
            // Trate qualquer exceção aqui
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
        try {
            processRequest(request, response);
        } catch (Exception ex) {
            Logger.getLogger(ServletCadastrarUsuario.class.getName()).log(Level.SEVERE, null, ex);
        }
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
        try {
            processRequest(request, response);
        } catch (Exception ex) {
            Logger.getLogger(ServletCadastrarUsuario.class.getName()).log(Level.SEVERE, null, ex);
        }
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
