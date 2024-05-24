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
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/globalCss.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/atualizarUsuario.css"> <!-- Adicione seu CSS aqui -->
    </head>

    <header>
        <div class="header">
            <div class="left-options">
                <ul class="nav">
                    <li><a href="url"><span><div class="iconLogo" id="iconLogoWidth"></div></span></a></li>
                    <li><a href="url">Gerenciar Planos</a></li>
                    <li><a href="url">Gerenciar Usuários</a></li>              
                </ul>
            </div>
            <div class="user-info">
                <span>Administrador</span>

                <button onclick="openSettings()">Configurações</button>
            </div>
        </div>
    </header>
    <body>
        <nav class="menu">
            <ul class="menu-list">
                <li><a onclick="mostrarDiv('addUser')">Adicionar Usuário</a></li>
                <li><a onclick="mostrarDiv('deleteUser')">Deletar Usuário</a></li>
                <li><a onclick="mostrarDiv('updateUser')">Atualizar Usuário</a></li>
                <li><a  onclick="mostrarDiv('listUsers')">Ver Lista de Usuários</a></li>
            </ul>
        </nav>

        <div class="paginaConteudo">
            <!-- Formulário para adicionar usuário -->
            <div id="addUser" class="div-menu">
                <h2>Adicionar Usuário</h2>
                <form action="${pageContext.request.contextPath}/ServletAdicionarUsuario" method="post">
                    <label for="nomeNovo">Nome:</label>
                    <input type="text" id="nomeNovo" name="nome" required>

                    <label for="senhaNova">Senha:</label>
                    <input type="password" id="senhaNova" name="senha" required>

                    <label for="cpfNovo">CPF:</label>
                    <input type="text" id="cpfNovo" name="cpf" required pattern="[0-9]{11}" title="Digite apenas números (11 dígitos)">

                    <label for="telefoneNovo">Endereço:</label>
                    <input type="text" id="enderecoNovo" name="endereco">

                    <label for="telefoneNovo">Telefone:</label>
                    <input type="text" id="telefoneNovo" name="telefone">

                    <button type="submit">Adicionar</button>
                </form>
            </div>

            <div id="updateUser" class="div-menu esconder">
                <!-- Formulário para alterar usuário -->
                <h2>Atualizar Usuário</h2>
                <form id="alterarUsuarioForm" method="get">
                    <label for="matriculaEditar">Matrícula do Usuário:</label>
                    <input type="text" id="matriculaEditar" name="matricula" required>
                    <button type="button" onclick="openModal()">Alterar</button>
                </form> 
            </div>

            <!-- Modal -->
            <div id="modal" class="modal">
                <div class="modal-content">
                    <span class="close" onclick="closeModal()">&times;</span>
                    <% if (usuario != null) { %>
                    <form id="editarUsuarioForm" action="${pageContext.request.contextPath}/ServletAlterarUsuario" method="post">
                        <h2>Editar Usuário</h2>
                        <input type="hidden" id="matricula" name="matricula" value="<%= usuario.getMatricula() %>">
                        <label for="nome">Nome:</label>
                        <input type="text" id="nome" name="nome" value="<%= usuario.getNome() %>" required>

                        <label for="senha">Senha:</label>
                        <input type="password" id="senha" name="senha" value="<%= usuario.getSenha() %>" required>

                        <label for="cpf">CPF:</label>
                        <input type="text" id="cpf" name="cpf" value="<%= usuario.getCpf() %>" required pattern="[0-9]{11}" title="Digite apenas números (11 dígitos)">

                        <label for="endereco">Endereço:</label>
                        <input type="text" id="endereco" name="endereco" value="<%= usuario.getEndereco() %>">

                        <label for="telefone">Telefone:</label>
                        <input type="text" id="telefone" name="telefone" value="<%= usuario.getTelefone() %>">

                        <button type="submit">Atualizar</button>
                    </form>
                    <% } else if (matriculaParam != null) { %>
                    <p>Usuário não encontrado.</p>
                    <% } %>
                </div>
            </div>

            <div id="deleteUser" class="div-menu esconder">
                <h2>Deletar Usuário</h2>
                <form id="deletarUsuarioForm" method="get">
                    <label for="matriculaDeletar">Matrícula do Usuário:</label>
                    <input type="text" id="matriculaDeletar" name="matricula" required>
                    <button type="button" onclick="openDeleteModal()">Deletar</button>
                </form>
            </div>

            <!-- Modal para Deletar -->
            <div id="deleteModal" class="modal">
                <div class="modal-content">
                    <span class="close" onclick="closeDeleteModal()">&times;</span>
                    <% if (usuario != null && request.getParameter("deletar") != null) { %>
                    <form id="deletarUsuarioConfirmForm" action="${pageContext.request.contextPath}/ServletDeletarUsuario" method="post">
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

            <div id="listUsers" class="div-menu esconder">
                <h2>Lista de Usuários</h2>
                <form action="${pageContext.request.contextPath}/ServletListaUsuarios" method="POST">
                    <button type="submit">Ver Lista de Usuários</button>
                </form>
            </div>

            <!-- Janela Modal de Configurações -->
            <div id="settingsModal" class="modal" style="display: none;">
                <div class="modal-content">
                    <span class="close" onclick="closeSettings()">&times;</span>
                    <h2>Configurações</h2>
                    <p>Área do Aluno</p>
                    <p><button type="submit"><a href="${pageContext.request.contextPath}/index.jsp" id="logoutButton">Sair</a></button></p>
                </div>
            </div>

            <script src="${pageContext.request.contextPath}/js/atualizarUsuario.js"></script>
            <script>
                <% if (usuario != null) { %>
                        document.getElementById('modal').style.display = "block";
                <% } %>
                <% if (usuario != null && request.getParameter("deletar") != null) { %>
                        document.getElementById('deleteModal').style.display = "block";
                <% } %>
            </script>
        </div>
    </body>

</html>