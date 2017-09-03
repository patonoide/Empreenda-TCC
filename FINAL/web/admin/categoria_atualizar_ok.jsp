<%-- 
    Document   : categoria_atualizar_ok
    Created on : Apr 7, 2017, 6:58:24 PM
    Author     : paton
--%>
<%@page import="modelo.Categoria"%>
<%@page import="DAO.CategoriaDAO"%>
<%String msg = "";

    if (request.getParameter("txtId") == null || request.getParameter("txtId").isEmpty()) {
        response.sendRedirect("categoria_listar.jsp");
        return;
    }

    String nome = request.getParameter("txtNome");
    String descricao = request.getParameter("txtDescricao");
    String id = request.getParameter("txtId");
    int x = Integer.parseInt(id);

    CategoriaDAO dao = new CategoriaDAO();

    Categoria obj = dao.buscarPorChavePrimaria(x);

    if (obj == null) {
        response.sendRedirect("categoria_listar.jsp");
        return;
    }

    obj.setDescricao(descricao);
    obj.setNome(nome);

    try {
        dao.alterar(obj);
        msg = "Registro alterado com sucesso";
    } catch (Exception ex) {
        msg = "Erro ao alterar registro";
    }

%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@include file="cabecalho_admin.jsp" %> 
<div class="content-login">
    <div class="mdl-grid">
        <div class="mdl-cell mdl-cell--4-col">
            <%=msg%>
        </div>
        
        
        <div class="mdl-cell mdl-cell--4-col">
            <a href="categoria_listar.jsp"> 
                <button type="submit" class="mdl-button mdl-js-button mdl-button--raised mdl-button--colored">
                    Voltar 
                </button>
            </a>
        </div>
    </div>
</div>
<%@include file="rodape.jsp"%>