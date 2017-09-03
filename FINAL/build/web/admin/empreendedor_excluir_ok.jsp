
<%--
    Document   : empreendedor_excluir_ok
    Created on : Apr 19, 2017, 4:14:51 PM
    Author     : paton
--%>


<%@page import="modelo.Empreendedor"%>
<%@page import="DAO.EmpreendedorDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    String msg = "";
    
    if(request.getParameter("id")== null)
    {
        response.sendRedirect("empreendedor_listar.jsp");
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

<!DOCTYPE html>
<%@include file="cabecalho_admin.jsp" %> 
<div class="content-login">
    <div class="mdl-grid">
        <div class="mdl-cell mdl-cell--4-col">
            <%=msg%>
        </div>
        
        
        <div class="mdl-cell mdl-cell--4-col">
            <a href="empreendedor_listar.jsp"> 
                <button type="submit" class="mdl-button mdl-js-button mdl-button--raised mdl-button--colored">
                    Voltar 
                </button>
            </a>
        </div>
    </div>
</div>
<%@include file="rodape.jsp"%>
