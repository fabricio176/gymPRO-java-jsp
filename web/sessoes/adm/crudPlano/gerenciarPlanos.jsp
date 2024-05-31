<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="br.com.controle.Plano"%>
<%@ page import="br.com.entidade.CadastroPlanoDAO"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Gerenciamento de Planos</title>
    </head>
    <body>
        <h1>Gerenciamento de Planos</h1>

        <!-- Formulário para adicionar plano -->
        <h2>Adicionar Plano</h2>
        <table>
            <tr>
                <td>
                    <form action="ServletPlano?action=adicionar" method="post">
                        <label for="nome">Nome:</label>
                        <input type="text" id="nome" name="nome" required>
                        </td>
                        <td>
                            <label for="tipo">Tipo:</label>
                            <input type="text" id="tipo" name="tipo" required>
                        </td>
                        <td>
                            <label for="valor">Valor:</label>
                            <input type="text" id="valor" name="valor" required>
                        </td>
                        <td>
                            <button type="submit">Adicionar</button>
                    </form>
                </td>
            </tr>
        </table>

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
                <% 
                    CadastroPlanoDAO planoDAO = new CadastroPlanoDAO();
                    ArrayList<Plano> listaPlanos = planoDAO.pesquisarTudo();
                    for (Plano plano : listaPlanos) { 
                %>
                <tr>
                    <td><%= plano.getCodigo() %></td>
                    <td><%= plano.getNome() %></td>
                    <td><%= plano.getTipo() %></td>
                    <td><%= plano.getValor() %></td>
                    <td>
                        <form action="ServletPlano?action=editar&codigo=<%= plano.getCodigo() %>" method="post">
                            <input type="hidden" name="codigo" value="<%= plano.getCodigo() %>">
                            <label for="nomeEdit">Nome:</label>
                            <input type="text" id="nomeEdit" name="nome" value="<%= plano.getNome() %>" required>

                            <label for="tipoEdit">Tipo:</label>
                            <input type="text" id="tipoEdit" name="tipo" value="<%= plano.getTipo() %>" required>

                            <label for="valorEdit">Valor:</label>
                            <input type="text" id="valorEdit" name="valor" value="<%= plano.getValor() %>" required>

                            <button type="submit">Editar</button>
                        </form>
                        <a href="ServletPlano?action=excluir&codigo=<%= plano.getCodigo() %>">Excluir</a>
                    </td>
                </tr>
                <% } %>
            </tbody>
        </table>
    </body>
</html>