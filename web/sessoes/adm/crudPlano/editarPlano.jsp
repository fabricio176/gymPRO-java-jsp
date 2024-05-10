<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
    // Recupera o parâmetro 'codigo' da URL
    int codigo = Integer.parseInt(request.getParameter("codigo"));

    // Variáveis para armazenar os dados do plano
    String nome = "";
    String tipo = "";
    String valor = "";

    // Estabelece a conexão com o banco de dados (supondo que você tenha configurado um pool de conexão)
    Connection connection = null;
    PreparedStatement statement = null;
    ResultSet resultSet = null;

    try {
        // Recupera os dados do plano com base no código
        Class.forName("com.mysql.jdbc.Driver");
        connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/seubanco", "seuusuario", "suasenha");
        String sql = "SELECT nome, tipo, valor FROM plano WHERE codigo = ?";
        statement = connection.prepareStatement(sql);
        statement.setInt(1, codigo);
        resultSet = statement.executeQuery();

        // Se o plano for encontrado, preenche as variáveis com os dados
        if (resultSet.next()) {
            nome = resultSet.getString("nome");
            tipo = resultSet.getString("tipo");
            valor = resultSet.getString("valor");
        }
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        // Fecha a conexão
        if (resultSet != null) {
            resultSet.close();
        }
        if (statement != null) {
            statement.close();
        }
        if (connection != null) {
            connection.close();
        }
    }
%>

<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Editar Plano</title>
</head>
<body>
    <h1>Editar Plano</h1>

    <!-- Formulário para editar plano -->
    <form action="atualizarPlano.jsp" method="post">
        <input type="hidden" name="codigo" value="<%= codigo %>">
        <label for="nome">Nome:</label>
        <input type="text" id="nome" name="nome" value="<%= nome %>" required><br><br>
        
        <label for="tipo">Tipo:</label>
        <input type="text" id="tipo" name="tipo" value="<%= tipo %>" required><br><br>
        
        <label for="valor">Valor:</label>
        <input type="text" id="valor" name="valor" value="<%= valor %>" required><br><br>
        
        <button type="submit">Atualizar</button>
    </form>
</body>
</html>
