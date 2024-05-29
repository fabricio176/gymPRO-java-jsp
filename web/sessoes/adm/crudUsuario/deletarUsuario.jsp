<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    // Recupera o parâmetro 'matricula' da URL
    int matricula = Integer.parseInt(request.getParameter("matricula"));

    // Verifica se o aluno com a matrícula especificada existe no banco de dados
    CadastroUsuarioDAO dao = new CadastroUsuarioDAO();
    Aluno aluno = dao.getUsuarioByMatricula(matricula);

    if (aluno != null) {
        // Se o aluno existe, redireciona para a página de edição
        response.sendRedirect("editarUsuario.jsp?matricula=" + matricula);
    } else {
        // Se o aluno não existe, exibe uma mensagem de erro
        response.sendRedirect("erro.jsp");
    }
%>

