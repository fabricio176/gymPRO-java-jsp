<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    // Recupera o parâmetro 'matricula' da URL
    int matricula = Integer.parseInt(request.getParameter("matricula"));

    // Redireciona para a página de edição de usuário com a matrícula do usuário
    response.sendRedirect("editarUsuario.jsp?matricula=" + matricula);
%>