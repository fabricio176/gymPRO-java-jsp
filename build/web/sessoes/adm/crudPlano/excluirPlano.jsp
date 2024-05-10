<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
    // Recupera o parâmetro 'codigo' da URL
    int codigo = Integer.parseInt(request.getParameter("codigo"));

    // Estabelece a conexão com o banco de dados (supondo que você tenha configurado um pool de conexão)
    Connection connection = null;
    PreparedStatement statement = null;

    try {
        // Exclui o plano com base no código
        Class.forName("com.mysql.jdbc.Driver");
        connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/seubanco", "seuusuario", "suasenha");
        String sql = "DELETE FROM plano WHERE codigo = ?";
        statement = connection.prepareStatement(sql);
        statement.setInt(1, codigo);
        statement.executeUpdate();
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        // Fecha a conexão
        if (statement != null) {
            statement.close();
        }
        if (connection != null) {
            connection.close();
        }
    }
    // Redireciona de volta para a página de gerenciamento de planos
    response.sendRedirect("gerenciarPlanos.html");
%>
