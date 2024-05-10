<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Gerenciamento de Usu�rios</title>
</head>
<body>
    <h1>Gerenciamento de Usu�rios</h1>

    <!-- Formul�rio para adicionar usu�rio -->
    <h2>Adicionar Usu�rio</h2>
    <form action="/gympro/ServletAdicionarUsuario" method="post">
        <label for="nome">Nome:</label>
        <input type="text" id="nome" name="nome" required><br><br>
        
        <label for="senha">Senha:</label>
        <input type="password" id="senha" name="senha" required><br><br>
        
        <label for="cpf">CPF:</label>
        <input type="text" id="cpf" name="cpf" required pattern="[0-9]{11}" title="Digite apenas n�meros (11 d�gitos)"><br><br>
        
        <label for="endereco">Endere�o:</label>
        <input type="text" id="endereco" name="endereco"><br><br>

        <label for="telefone">Telefone:</label>
        <input type="text" id="telefone" name="telefone"><br><br>
        
        <button type="submit">Adicionar</button>
    </form>

    <!-- Formul�rio para alterar usu�rio -->
    <h2>Alterar Usu�rio</h2>
    <form action="alterarUsuario.jsp" method="get">
        <label for="matriculaEditar">Matr�cula do Usu�rio:</label>
        <input type="text" id="matriculaEditar" name="matricula" required><br><br>
        <button type="submit">Alterar</button>
    </form>

    <!-- Formul�rio para deletar usu�rio -->
    <h2>Deletar Usu�rio</h2>
    <form action="deletarUsuario.jsp" method="get">
        <label for="matriculaDeletar">Matr�cula do Usu�rio:</label>
        <input type="text" id="matriculaDeletar" name="matricula" required><br><br>
        <button type="submit">Deletar</button>
    </form>
    
    <h2><a href="editarUsuario.jsp"> Editar Usuario</a></h2>
    
    
</body>
</html>