
<%-- 
    Document   : franquiador_excluir_ok
    Created on : Mar 27, 2017, 1:38:25 PM
    Author     : paton
--%>

<%@page import="DAO.FranquiadorDAO"%>
<%@page import="modelo.Franquiador"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@include file="cabecalho_franquiador.jsp"%>
<script src="mdl/material.min.js"></script>
<script src="mdl/jquery-2.1.4.min.js"></script>
<%
    String msg = "";
    
    if(request.getParameter("id")== null)
    {
        response.sendRedirect("login_franquiador.jsp");
    }
    else
    {
        String codigo = request.getParameter("id");
        
        FranquiadorDAO dao = new FranquiadorDAO();
        //buscar o registro pela chave primária
        Franquiador obj = dao.buscarPorChavePrimariaString(codigo);
        
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

 
<div class="content-login">
    <div class="mdl-grid">
        <div class="mdl-cell mdl-cell--4-col">
            <%=msg%>
        </div>
        
        
        <div class="mdl-cell mdl-cell--4-col">
            <a href="informacoes.jsp"> 
                <button type="submit" class="mdl-button mdl-js-button mdl-button--raised mdl-button--colored">
                    Voltar 
                </button>
            </a>
        </div>
    </div>
</div>
<%@include file="rodape_franquiador.jsp"%>