<%-- 
    Document   : sessaoUsuario
    Created on : 9 de mai. de 2024, 21:14:52
    Author     : victo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="br.com.controle.Aluno, br.com.entidade.CadastroUsuarioDAO" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>GymPro Academia</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/globalCss.css"/>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/sessaoUsuario.css"/>
    </head>
    <header>    
        <!-- Cabeçalho -->
        <div class="header">
            <div class="left-options">
                <ul class="nav">
                    <li><a href="url"><span><div class="iconLogo" id="iconLogoWidth"></div></span></a></li>
                    <li><a href="url">Meus Planos</a></li>
                    <li><a href="url">Meu Cadastro</a></li>              
                </ul>

            </div>
            <div class="user-info">
                <% 
    String nomeUsuario = (String)request.getAttribute("nomeUsuario");
    if (nomeUsuario != null) {
                %>
                <span>Bem-vindo <%= nomeUsuario %></span>
                <% 
                    } else {
                        nomeUsuario = (String)request.getSession().getAttribute("nomeUsuario");
                        if (nomeUsuario != null) {
                %>
                <span>Bem-vindo <%= nomeUsuario %></span>
                <% 
                        }
                    }
                %>
                <button onclick="openSettings()">Configurações</button>
            </div>
        </div>
    </header>
    <body

        <!-- Janela Modal de Configurações -->
        <div id="settingsModal" class="modal" style="display: none;">
            <div class="modal-content">
                <span class="close" onclick="closeSettings()">&times;</span>
                <h2>Configurações</h2>
                <p>Área do Aluno</p>
                <p><button type="submit"> <a href="${pageContext.request.contextPath}/index.jsp" id="logoutButton">Sair</a></p></button>
            </div>
        </div>
    </body>
    <script src="${pageContext.request.contextPath}/js/sessaoUsuario.js"></script>

</html>
