package br.com.bean;

import br.com.controle.Aluno;
import br.com.entidade.CadastroUsuarioDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name = "ServletAdicionarUsuario", urlPatterns = {"/ServletAdicionarUsuario"})
public class ServletAdicionarUsuario extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        String nome = request.getParameter("nomeNovo");
        String senha = request.getParameter("senhaNova");
        String cpf = request.getParameter("cpfNovo");
        String endereco = request.getParameter("enderecoNovo");
        String telefone = request.getParameter("telefoneNovo");

        Aluno a = new Aluno();
        a.setNome(nome);
        a.setSenha(senha);
        a.setCpf(cpf);
        a.setEndereco(endereco);
        a.setTelefone(telefone);

        CadastroUsuarioDAO dao = new CadastroUsuarioDAO();

        try {
            dao.inserir(a);
            HttpSession session = request.getSession();
            session.setAttribute("insercaoSucesso", true);
            response.sendRedirect(request.getContextPath() + "/sessoes/adm/crudUsuario/alterarDadosUsuarios.jsp"); // Redirecionamento para página de sucesso
        } catch (Exception e) {
            e.printStackTrace(); // Imprimir a exceção para depuração
            HttpSession session = request.getSession();
            session.setAttribute("insercaoErro", true); // Definir atributo de sessão para erro de inserção
            response.sendRedirect(request.getContextPath() + "/erro.jsp"); // Redirecionamento para página de erro
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
