<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Lista de Usuários</title>
</head>
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
</html>