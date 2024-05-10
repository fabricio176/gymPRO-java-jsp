<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Gerenciamento de Usuários</title>
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
    <form action="alterarUsuario.jsp" method="get">
        <label for="matriculaEditar">Matrícula do Usuário:</label>
        <input type="text" id="matriculaEditar" name="matricula" required><br><br>
        <button type="submit">Alterar</button>
    </form>

    <!-- Formulário para deletar usuário -->
    <h2>Deletar Usuário</h2>
    <form action="deletarUsuario.jsp" method="get">
        <label for="matriculaDeletar">Matrícula do Usuário:</label>
        <input type="text" id="matriculaDeletar" name="matricula" required><br><br>
        <button type="submit">Deletar</button>
    </form>
    
    <h2><a href="editarUsuario.jsp"> Editar Usuario</a></h2>
    
    
</body>
</html>