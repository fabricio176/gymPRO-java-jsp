<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    // Nome de usuário e senha fixos (não seguro para uso em produção)
    String usernameCorreto = "admin";
    String passwordCorreta = "admin123";

    // Recebe os parâmetros do formulário de login
    String username = request.getParameter("nome");
    String password = request.getParameter("senha");

    // Verifica se o nome de usuário e a senha correspondem aos valores fixos
    if (username.equals(usernameCorreto) && password.equals(passwordCorreta)) {
        // Se as credenciais estiverem corretas, redirecionamos para uma página de sucesso
        response.sendRedirect("crudUsuario/alterarDadosUsuarios.jsp");
    } else {
        // Caso contrário, redirecionamos de volta para a página de login com uma mensagem de erro
        response.sendRedirect("loginAdm.jsp?erro=true");
    }
%>
