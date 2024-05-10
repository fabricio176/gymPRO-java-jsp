<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login do Administrador</title>
</head>
<body>
    <h1>Login do Administrador</h1>

    <%-- Verifica se houve uma tentativa de login --%>
    <% String mensagem = (String)request.getAttribute("mensagem"); %>
    <% if (mensagem != null) { %>
        <p><%= mensagem %></p>
    <% } %>

    <form action="authAdm.jsp" method="post">
        <label for="username">Nome de usuário:</label>
        <input type="text" id="username" name="nome" required><br><br>

        <label for="password">Senha:</label>
        <input type="password" id="password" name="senha" required><br><br>

        <button type="submit">Login</button>
    </form>
</body>
</html>