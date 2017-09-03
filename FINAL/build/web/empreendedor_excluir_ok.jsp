<%-- 
    Document   : empreendedor_excluir_ok
    Created on : Mar 27, 2017, 1:38:36 PM
    Author     : paton
--%>

<%@page import="modelo.Empreendedor"%>
<%@page import="DAO.FranquiaDAO"%>
<%@page import="DAO.EmpreendedorDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    String msg = "";
    
    if(request.getParameter("id")== null)
    {
        response.sendRedirect("informacoes.jsp");
    }
    else
    {
        String codigo = request.getParameter("id");
        
        EmpreendedorDAO dao = new EmpreendedorDAO();
        //buscar o registro pela chave primária
        Empreendedor obj = dao.buscarPorChavePrimariaString(codigo);
        
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
<%@include file="cabecalho.jsp"%>
 <div class="mdl-card__supporting-text content-login nquebra">
            <h4>Empreendedor - Excluído</h4>
            <p><%=msg%></p>
            <a href="login_empreendedor.jsp"> <button type="submit" class="mdl-button mdl-js-button mdl-button--raised mdl-button--colored">
            Login
        </button></a>
            
        </div>

<%@include file="rodape.jsp"%>