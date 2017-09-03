<%-- 
    Document   : franquiador_excluir_ok
    Created on : Apr 17, 2017, 2:18:02 PM
    Author     : paton
--%>


<%@page import="modelo.Franquiador"%>
<%@page import="DAO.FranquiadorDAO"%>
<!DOCTYPE html>
<%
    String msg = "";
    
    if(request.getParameter("id")== null)
    {
        response.sendRedirect("franquiador_listar.jsp");
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
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@include file="cabecalho_admin.jsp" %> 
<div class="content-login">
    <div class="mdl-grid">
        <div class="mdl-cell mdl-cell--4-col">
            <%=msg%>
        </div>
        
        
        <div class="mdl-cell mdl-cell--4-col">
            <a href="franquiador_listar.jsp"> 
                <button type="submit" class="mdl-button mdl-js-button mdl-button--raised mdl-button--colored">
                    Voltar 
                </button>
            </a>
        </div>
    </div>
</div>
<%@include file="rodape.jsp"%>
