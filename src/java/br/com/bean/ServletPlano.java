package br.com.bean;

import br.com.controle.Plano;
import br.com.entidade.CadastroPlanoDAO;
import java.io.IOException;
import java.util.ArrayList;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(name = "ServletPlano", urlPatterns = {"/ServletPlano"})
public class ServletPlano extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        String action = request.getParameter("action");

        if (action != null) {
            switch (action) {
                case "adicionar":
                    adicionarPlano(request, response);
                    break;
                case "excluir":
                    excluirPlano(request, response);
                    break;
                case "alterar":
                    alterarPlano(request, response);
                    break;
                default:
                    response.sendRedirect("gerenciarPlanos.jsp");
                    break;
            }
        } else {
            response.sendRedirect("gerenciarPlanos.jsp");
        }
    }

    private void adicionarPlano(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String nome = request.getParameter("nome");
        String tipo = request.getParameter("tipo");
        String valor = request.getParameter("valor");

        Plano novoPlano = new Plano();
        novoPlano.setNome(nome);
        novoPlano.setTipo(tipo);
        novoPlano.setValor(valor);

        CadastroPlanoDAO dao = new CadastroPlanoDAO();
        try {
            dao.inserir(novoPlano);
            response.sendRedirect("gerenciarPlanos.jsp");
        } catch (Exception ex) {
            ex.printStackTrace();
            // Tratar erro adequadamente
        }
    }

    private void excluirPlano(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int codigo = Integer.parseInt(request.getParameter("codigo"));

        CadastroPlanoDAO dao = new CadastroPlanoDAO();
        try {
            Plano plano = dao.pesquisar(codigo);
            if (plano != null) {
                dao.deletar(plano);
            }
            response.sendRedirect("sessoes/adm/crudPlano/gerenciarPlanos.jsp");
        } catch (Exception ex) {
            ex.printStackTrace();
            // Tratar erro adequadamente
        }
    }

    private void alterarPlano(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int codigo = Integer.parseInt(request.getParameter("codigo"));
        String nome = request.getParameter("nome");
        String tipo = request.getParameter("tipo");
        String valor = request.getParameter("valor");

        Plano plano = new Plano();
        plano.setCodigo(codigo);
        plano.setNome(nome);
        plano.setTipo(tipo);
        plano.setValor(valor);

        CadastroPlanoDAO dao = new CadastroPlanoDAO();
        try {
            dao.alterar(plano);
            response.sendRedirect("gerenciarPlanos.jsp");
        } catch (Exception ex) {
            ex.printStackTrace();
            // Tratar erro adequadamente
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