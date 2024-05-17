<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="br.com.entidade.CadastroUsuarioDAO" %>
<%@ page import="br.com.controle.Aluno" %>

<%
    String matriculaParam = request.getParameter("matricula");
    Aluno usuario = null;
    if (matriculaParam != null && !matriculaParam.isEmpty()) {
        int matricula = Integer.parseInt(matriculaParam);
        CadastroUsuarioDAO usuarioDAO = new CadastroUsuarioDAO();
        try {
            usuario = usuarioDAO.getUsuarioByMatricula(matricula);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
%>
<!DOCTYPE html>
<html lang="pt-BR">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Gerenciamento de Usuários</title>
        <link rel="stylesheet" href="../../../css/atualizarUsuario.css"> <!-- Adicione seu CSS aqui -->
    </head>
    <body>
        <h1>Gerenciamento de Usuários</h1>

        <!-- Formulário para adicionar usuário -->
        <h2>Adicionar Usuário</h2>
        <form action="/gympro/ServletAdicionarUsuario" method="post">
            <label for="nome">Nome:</label>
            <input type="text" id="nome" name="nome" required><br><br>

            <label for="senha">Senha:</label>
            <input type="password" id="senha" name="senha" required><br><br>

            <label for="cpf">CPF:</label>
            <input type="text" id="cpf" name="cpf" required pattern="[0-9]{11}" title="Digite apenas números (11 dígitos)"><br><br>

            <label for="endereco">Endereço:</label>
            <input type="text" id="endereco" name="endereco"><br><br>

            <label for="telefone">Telefone:</label>
            <input type="text" id="telefone" name="telefone"><br><br>

            <button type="submit">Adicionar</button>
        </form>

        <!-- Formulário para alterar usuário -->
        <h2>Alterar Usuário</h2>
        <form id="alterarUsuarioForm" method="get">
            <label for="matriculaEditar">Matrícula do Usuário:</label>
            <input type="text" id="matriculaEditar" name="matricula" required><br><br>
            <button type="button" onclick="openModal()">Alterar</button>
        </form>

        <!-- Modal -->
        <div id="modal" class="modal">
            <div class="modal-content">
                <span class="close" onclick="closeModal()">&times;</span>

                <% if (usuario != null) { %>
                <form id="editarUsuarioForm" action="/gympro/ServletAlterarUsuario" method="post">
                    <h2>Editar Usuário</h2>
                    <input type="hidden" id="matricula" name="matricula" value="<%= usuario.getMatricula() %>">
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
                <% } else if (matriculaParam != null) { %>
                <p>Usuário não encontrado.</p>
                <% } %>
            </div>
        </div>

        <h2>Deletar Usuário</h2>
        <form id="deletarUsuarioForm" method="get">
            <label for="matriculaDeletar">Matrícula do Usuário:</label>
            <input type="text" id="matriculaDeletar" name="matricula" required><br><br>
            <button type="button" onclick="openDeleteModal()">Deletar</button>
        </form>

        <!-- Modal para Deletar -->
        <div id="deleteModal" class="modal">
            <div class="modal-content">
                <span class="close" onclick="closeDeleteModal()">&times;</span>

                <% if (usuario != null && request.getParameter("deletar") != null) { %>
                <form id="deletarUsuarioConfirmForm" action="/gympro/ServletDeletarUsuario" method="post">
                    <h2>Deletar Usuário</h2>
                    <p>Tem certeza que deseja deletar o usuário <strong><%= usuario.getNome() %></strong>?</p>
                    <input type="hidden" id="matriculaDeletarConfirm" name="matricula" value="<%= usuario.getMatricula() %>">
                    <button type="submit">Deletar</button>
                    <button type="button" onclick="closeDeleteModal()">Cancelar</button>
                </form>
                <% } else if (request.getParameter("deletar") != null) { %>
                <p>Usuário não encontrado.</p>
                <% } %>
            </div>
        </div>

        

        <h2>Lista de Usuários</h2>
        <form action="/gympro/ServletListaUsuarios" method="POST">
            <input type="submit" value="VER LISTA DE USUARIOS" />
        </form>

        <script src="../../../js/atualizarUsuario.js"></script>
        <script>
            <% if (usuario != null) { %>

                        document.getElementById('modal').style.display = "block";
            <% } %>
            <% if (usuario != null && request.getParameter("deletar") != null) { %>
                        document.getElementById('deleteModal').style.display = "block";
            <% } %>
        </script>


    </body>
</html>