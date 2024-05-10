<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="br.com.entidade.CadastroUsuarioDAO" %>
<%@ page import="br.com.controle.Aluno" %>

<%
    int matricula = Integer.parseInt(request.getParameter("matricula"));
    CadastroUsuarioDAO Usuario = new CadastroUsuarioDAO();
    Aluno usuario = null;
    
    try {
        usuario = Usuario.getUsuarioByMatricula(matricula);
    } catch (Exception e) {
        // Trate o erro adequadamente, exibindo uma mensagem de erro na página ou redirecionando para uma página de erro.
        e.printStackTrace();
    }
%>

<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Editar Usuário</title>
</head>
<body>
    <h1>Editar Usuário</h1>

    <!-- Verifique se o usuário foi encontrado antes de acessar seus atributos -->
    <% if (usuario != null) { %>
        <form action="/gympro/ServletAlterarUsuario" method="post">
            <input type="hidden" name="matricula" value="<%= usuario.getMatricula() %>">
            <label for="nome">Nome:</label>
            <input type="text" id="nome" name="nome" value="<%= usuario.getNome() %>" required><br><br>
            
            <label for="senha">Senha:</label>
            <input type="password" id="senha" name="senha" value="<%= usuario.getSenha() %>" required><br><br>
            
            <label for="cpf">CPF:</label>
            <input type="text" id="cpf" name="cpf" value="<%= usuario.getCpf() %>" required pattern="[0-9]{11}" title="Digite apenas números (11 dígitos)"><br><br>

            <label for="endereco">Endereço:</label>
            <input type="text" id="endereco" name="endereco" value="<%= usuario.getEndereco() %>"><br><br>

            <label for="telefone">Telefone:</label>
            <input type="text" id="telefone" name="telefone" value="<%= usuario.getTelefone() %>"><br><br>
            
            <button type="submit">Atualizar</button>
        </form>
    <% } else { %>
        <p>Usuário não encontrado.</p>
    <% } %>
</body>
</html>