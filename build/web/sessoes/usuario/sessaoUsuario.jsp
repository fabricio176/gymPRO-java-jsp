<%-- 
    Document   : sessaoUsuario
    Created on : 9 de mai. de 2024, 21:14:52
    Author     : victo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="br.com.controle.Aluno, br.com.entidade.CadastroUsuarioDAO" %>
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
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="css/sessaoUsuario.css"/>
        
    </head>
    <!-- Cabeçalho -->
    <div class="header">
        <div class="left-options">
            <span>LOGO</span>
            <span>Cidade</span>
        </div>
        <div class="user-info">
            <span><%= usuario.getNome() %></span>
            <button onclick="openSettings()">Configurações</button>
        </div>
    </div>

    <!-- Corpo da página -->
    <div class="options">
        <div class="option">
            <h2>Meus Planos</h2>
            <!-- Adicione aqui o conteúdo para a opção "Meus Planos" -->
        </div>
        <div class="option">
            <h2>Meu Cadastro</h2>
            <!-- Adicione aqui o conteúdo para a opção "Meu Cadastro" -->
        </div>
        <div class="option">
            <h2>Sair</h2>
            <!-- Adicione aqui o código para sair da sessão -->
        </div>
    </div>

    <!-- Janela Modal de Configurações -->
    <div id="settingsModal" class="modal" style="display: none;">
        <div class="modal-content">
            <span class="close" onclick="closeSettings()">&times;</span>
            <h2>Configurações</h2>
            <p>Área do Aluno</p>
            <p>Sair</p>
        </div>
    </div>
    <script src="js/sessaoUsuario.js"></script>
</html>
