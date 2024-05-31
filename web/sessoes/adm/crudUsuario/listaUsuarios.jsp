<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="pt-BR">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Lista de Usuários</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/header.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/globalCss.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/listaUsuarios.css">
    </head>

    <header>
        <div class="header">
            <div class="left-options">
                <ul class="nav">
                    <li><a href="url"><span><div class="iconLogo" id="iconLogoWidth"></div></span></a></li>
                    <li><a href="">Gerenciar Planos</a></li>
                    <li><a href="${pageContext.request.contextPath}/sessoes/adm/crudUsuario/alterarDadosUsuarios.jsp">Gerenciar Usuários</a></li>              
                </ul>
            </div>


            <ul class="nav">
                <li><span> Página do Administrador</span></li>
                <li><a href="${pageContext.request.contextPath}/sessoes/adm/loginAdm.jsp">SAIR</a></li>

            </ul>
        </div>
    </header>
    <body>

        <h1>Lista de Usuários</h1>

        <table border="1">
            <thead>
                <tr>
                    <th>Matrícula</th>
                    <th>Nome</th>
                    <th>CPF</th>
                    <th>Endereço</th>
                    <th>Telefone</th>
                </tr>
            </thead>
            <tbody>
                <!-- Utilizando a tag forEach para iterar sobre a lista de usuários -->
                <c:forEach var="usuario" items="${listaUsuarios}">
                    <tr>
                        <td>${usuario.matricula}</td>
                        <td>${usuario.nome}</td>
                        <td>${usuario.cpf}</td>
                        <td>${usuario.endereco}</td>
                        <td>${usuario.telefone}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>    


    </body>
    <footer class="footer">
        <div class="footer-content">
            <p>&copy; 2024 Fabrício Taveira e Victor Garcia. Todos os direitos reservados.</p>
            <ul class="footer-links">
                <li><a href="tel:+55123456789">Telefone: (12) 3456-789</a></li>
                <li><a href="mailto:contato@seudominio.com">Email: gympro@gympro.com</a></li>
            </ul>
        </div>
    </footer>
    <script src="${pageContext.request.contextPath}/js/atualizarUsuario.js"></script>
</html>