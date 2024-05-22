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
         <link rel="stylesheet" href="${pageContext.request.contextPath}/css/globalCss.css"/>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/index.css"/>
    </head>
    <body>
        <div class="iconLogo" id="iconLogoWidth"></div>

        <div class="containerLogin">
            <div class="containerScreenLogin">
                <div id="gif-container">
                    <img id="gif" src="assets/imgLevantando.png" alt="Pessoa levantando peso">
                    <img id="static-image" src="assets/gifLevantando.gif" alt="Imagem estática">
                </div>
                <form id="loginForm" method="post" action="/gympro/ServletLogin">
                    <label for="cpf">CPF:</label><br>
                    <input type="text" id="cpf" name="cpf" placeholder="Digite seu CPF" required maxlength="11"><br>
                    <label for="senha">Senha:</label><br>
                    <input type="password" id="senha" name="senha" placeholder="Digite sua senha" required maxlength="20"><br>
                    <input type="submit" value="Login">
                    <br><br>
                    <input type="submit" value="Contrate seu Plano" id="openModalBtn">
                </form>
            </div>
        </div>



        <!-- Janela Modal -->
        <div id="modal" class="overlay">
            <div class="modal">
                <h2>Cadastro de Aluno</h2>
                <form id="cadastroForm" method="post" action="/gympro/ServletCadastrarUsuario">
                    <label for="nome">Nome:</label><br>
                    <input type="text" id="nome" name="nome" required maxlength="60"><br>
                    <label for="senha">Senha:</label><br>
                    <input type="password" id="senhaCadastro" name="senhaCadastro" required maxlength="20"> <br>
                    <label for="cpf">CPF:</label><br>
                    <input type="text" id="cpfCadastro" name="cpfCadastro" required maxlength="11"><br>
                    <label for="endereco">Endereço:</label><br>
                    <input type="text" id="endereco" name="endereco" maxlength="60"><br>
                    <label for="telefone">Telefone:</label><br>
                    <input type="text" id="telefone" name="telefone"><br><br>
                    <input type="submit" value="Cadastrar">
                </form>
            </div>
        </div>



    </form>

    <script src="js/index.js"></script>
</body>
</html>
