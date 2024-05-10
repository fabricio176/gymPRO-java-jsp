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
import java.util.ArrayList;

/**
 *
 * @author victo
 */
@WebServlet(name = "ServletAdicionarUsuario", urlPatterns = {"/ServletAdicionarUsuario"})
public class ServletAdicionarUsuario extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {

            String nome = request.getParameter("nome");
            String senha = request.getParameter("senha");
            String cpf = request.getParameter("cpf");
            String endereco = request.getParameter("endereco");
            String telefone = request.getParameter("telefone");

            Aluno a = new Aluno();
            a.setNome(nome);
            a.setSenha(senha);
            a.setCpf(cpf);
            a.setEndereco(endereco);
            a.setTelefone(telefone);

            CadastroUsuarioDAO dao = new CadastroUsuarioDAO();

            try {
                dao.inserir(a);
                request.setAttribute(nome, a.getNome());
                request.setAttribute(senha, a.getSenha());
                request.setAttribute(cpf, a.getCpf());
                request.setAttribute(endereco, a.getEndereco());
                request.setAttribute(telefone, a.getTelefone());

                ArrayList<Aluno> listaUsuarios = dao.pesquisarTudo();

                request.setAttribute("listaUsuarios", listaUsuarios);
                
                
                RequestDispatcher rd = request.getRequestDispatcher("sessoes/adm/listaUsuarios.jsp");
                rd.forward(request, response);

            } catch (Exception e) {

            }

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
