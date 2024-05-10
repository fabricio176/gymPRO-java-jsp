<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    // Recupera o parâmetro 'matricula' da URL
    int matricula = Integer.parseInt(request.getParameter("matricula"));

    response.sendRedirect("editarUsuario.jsp?matricula=" + matricula);
%>

