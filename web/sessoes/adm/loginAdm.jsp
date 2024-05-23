<!DOCTYPE html>
<html lang="pt-BR">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Login do Administrador</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/globalCss.css"/>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/index.css"/>
    </head>
    <body>


        <%-- Verifica se houve uma tentativa de login --%>
        <% String mensagem = (String)request.getAttribute("mensagem"); %>
        <% if (mensagem != null) { %>
        <p><%= mensagem %></p>
        <% } %>

        <div class="iconLogo" id="iconLogoWidth"></div>
        <div class="containerLogin">
            <div class="containerScreenLogin">
                <h1 style="text-align: center;" >Login do Administrador</h1>

                <form id="loginForm" method="post" action="authAdm.jsp">
                    <label for="username">Nome de Usuário</label><br>
                    <input type="text" id="username" name="nome" placeholder="Digite seu nome de usuário" required maxlength="11"><br>
                    <label for="password">Senha:</label><br>
                    <input type="password" id="password" name="senha" placeholder="Digite sua senha" required maxlength="20"><br>
                    <input type="submit" value="Login">
                    <br><br>         
                </form>
            </div>
        </div>
    </body>
    <script src="${pageContext.request.contextPath}/js/index.js"></script>
</html>