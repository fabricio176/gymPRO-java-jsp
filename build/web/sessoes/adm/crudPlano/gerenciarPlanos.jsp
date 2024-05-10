<%-- 
    Document   : gerenciarPlanos
    Created on : 9 de mai. de 2024, 21:35:55
    Author     : victo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Gerenciamento de Planos</title>
</head>
<body>
    <h1>Gerenciamento de Planos</h1>

    <!-- Formulário para adicionar plano -->
    <h2>Adicionar Plano</h2>
    <form action="adicionarPlano.jsp" method="post">
        <label for="nome">Nome:</label>
        <input type="text" id="nome" name="nome" required><br><br>
        
        <label for="tipo">Tipo:</label>
        <input type="text" id="tipo" name="tipo" required><br><br>
        
        <label for="valor">Valor:</label>
        <input type="text" id="valor" name="valor" required><br><br>
        
        <button type="submit">Adicionar</button>
    </form>

    <!-- Tabela para listar planos existentes -->
    <h2>Lista de Planos</h2>
    <table border="1">
        <thead>
            <tr>
                <th>Código</th>
                <th>Nome</th>
                <th>Tipo</th>
                <th>Valor</th>
                <th>Ações</th>
            </tr>
        </thead>
        <tbody>
            <!-- Aqui você pode preencher dinamicamente os dados da tabela com os planos existentes -->
            <!-- Por exemplo, usando JSP para obter os dados do banco de dados -->
            <!-- <tr>
                <td>1</td>
                <td>Plano A</td>
                <td>Tipo A</td>
                <td>R$ 100,00</td>
                <td>
                    <a href="editarPlano.jsp?codigo=1">Editar</a>
                    <a href="excluirPlano.jsp?codigo=1">Excluir</a>
                </td>
            </tr> -->
        </tbody>
    </table>
</body>
</html>
