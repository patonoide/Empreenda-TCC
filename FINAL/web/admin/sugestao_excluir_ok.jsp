<%-- 
    Document   : sugestao_excluir
    Created on : 02/09/2017, 11:44:36
    Author     : Asus
--%>

<%@page import="modelo.Avalia"%>
<%@page import="DAO.AvaliaDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    String msg = "";
    
    if(request.getParameter("id")== null)
    {
        response.sendRedirect("sugestao_listar.jsp");
    }
    else
    {
        String codigo = request.getParameter("id");
        
        AvaliaDAO dao = new AvaliaDAO();
        //buscar o registro pela chave primária
        Avalia obj = dao.buscarPorChavePrimaria(Integer.parseInt(codigo));
        
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
            <a href="sugestao_listar.jsp"> 
                <button type="submit" class="mdl-button mdl-js-button mdl-button--raised mdl-button--colored">
                    Voltar 
                </button>
            </a>
        </div>
    </div>
</div>
<%@include file="rodape.jsp"%>
