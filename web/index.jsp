<%-- 
    Document   : index.jsp
    Created on : 6 de mai. de 2024, 20:34:21
    Author     : laboratorio
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Página de cadastro</title>
        <link rel="stylesheet" href="css/index.css"/>
    </head>
    <body>
        <h1>GYMPRO</h1>
        <h2>A Academia do Povo!</h2>
        <div class="bannerPet"></div>

        <div class="containerLogin">
            <h2>Tela de Login</h2>
            <form id="loginForm">
                <label for="cpf">CPF:</label><br>
                <input type="text" id="cpf" name="cpf" placeholder="Digite seu CPF" required><br>
                <label for="senha">Senha:</label><br>
                <input type="password" id="senha" name="senha" placeholder="Digite sua senha" required><br>
                <input type="submit" value="Login">
            </form>
        </div>

        <h2>Contrate seu Plano</h2>
        <button id="openModalBtn">Cadastrar-se</button>

        <!-- Janela Modal -->
        <div id="modal" class="overlay">
            <div class="modal">
                <h2>Cadastro de Aluno</h2>
                <form id="cadastroForm">
                    <label for="nome">Nome:</label><br>
                    <input type="text" id="nome" name="nome" required><br>
                    <label for="senha">Senha:</label><br>
                    <input type="password" id="senha" name="senha" required><br>
                    <label for="cpf">CPF:</label><br>
                    <input type="text" id="cpf" name="cpf" required minlength="11" maxlength="11"><br>
                    <label for="endereco">Endereço:</label><br>
                    <input type="text" id="endereco" name="endereco"><br>
                    <label for="telefone">Telefone:</label><br>
                    <input type="text" id="telefone" name="telefone"><br><br>
                    <button type="submit">Cadastrar</button>
                </form>
            </div>
        </div>



    </form>

    <script src="js/globalJs.js"></script>
</body>
</html>
