<%-- 
    Document   : categoria_excluir_ok
    Created on : Apr 7, 2017, 6:58:50 PM
    Author     : paton
--%>
<%@page import="modelo.Categoria"%>
<%@page import="DAO.CategoriaDAO"%>
<%
    String msg = "";
    
    if(request.getParameter("id")== null)
    {
        response.sendRedirect("categoria_listar.jsp");
    }
    else
    {
        String codigo = request.getParameter("id");
        int x = Integer.parseInt(codigo);
        CategoriaDAO dao = new CategoriaDAO();
        //buscar o registro pela chave primária
        Categoria obj = dao.buscarPorChavePrimaria(x);
        
        if(obj!= null)
        {
            if(dao.excluir(obj))
            {
            msg = "Registro excluído com sucesso";
            }
            else
            {
                msg = "Não foi possível excluir";
            }
        }
        else
        {
            msg = "Registro não encontrado. Verifique.";
        }
        
    }
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@include file="cabecalho_admin.jsp" %> 
<div class="content-cadastrar"><%=msg%>
    <a href="categoria_listar.jsp"> 
        <button type="submit" class="mdl-button mdl-js-button mdl-button--raised mdl-button--colored">
            Voltar 
        </button>
    </a>
</div>
<%@include file="rodape.jsp"%>