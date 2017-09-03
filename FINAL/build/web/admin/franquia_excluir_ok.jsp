<%-- 
    Document   : franquia_excluir_ok
    Created on : Apr 19, 2017, 4:13:44 PM
    Author     : paton
--%>

<%@page import="modelo.Franquia"%>
<%@page import="DAO.FranquiaDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    String msg = "";
    
    if(request.getParameter("id")== null)
    {
        response.sendRedirect("franquia_listar.jsp");
    }
    else
    {
        String codigo = request.getParameter("id");
        
        FranquiaDAO dao = new FranquiaDAO();
        //buscar o registro pela chave primária
        Franquia obj = dao.buscarPorChavePrimaria(Integer.parseInt(codigo));
        
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

<!DOCTYPE html>
<%@include file="cabecalho_admin.jsp" %> 
<div class="content-login">
    <div class="mdl-grid">
        <div class="mdl-cell mdl-cell--4-col">
            <%=msg%>
        </div>
        
        
        <div class="mdl-cell mdl-cell--4-col">
            <a href="franquia_listar.jsp"> 
                <button type="submit" class="mdl-button mdl-js-button mdl-button--raised mdl-button--colored">
                    Voltar 
                </button>
            </a>
        </div>
    </div>
</div>
<%@include file="rodape.jsp"%>