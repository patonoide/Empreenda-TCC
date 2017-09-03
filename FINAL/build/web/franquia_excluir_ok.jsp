<%-- 
    Document   : franquia_excluir_ok
    Created on : Mar 27, 2017, 1:39:36 PM
    Author     : paton
--%>
<%@page import="modelo.Franquia"%>
<%@page import="DAO.FranquiaDAO"%>
<%
    String msg = "";
     String cnpj = session.getAttribute("franquiador").toString();
     
    if(request.getParameter("id")== null)
    {
        response.sendRedirect("franquiador_meuperfil.jsp");
    }
    else
    {
        String codigo = request.getParameter("id");
        
        FranquiaDAO dao = new FranquiaDAO();
        //buscar o registro pela chave primária
        Franquia obj = dao.buscarPorChavePrimaria(Integer.parseInt(codigo));
          if( obj.getFranquiador().getCnpj() != cnpj){
        response.sendRedirect("franquiador_meuperfil.jsp");
    
    
    }
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
<%@include file="cabecalho_franquiador.jsp"%>
 <div class="mdl-card__supporting-text content-login nquebra">
            <h4>Franquia - Excluída</h4>
            <p><%=msg%></p>
            <a href="franquiador_meuperfil.jsp"> <button type="submit" class="mdl-button mdl-js-button mdl-button--raised mdl-button--colored">
            Voltar
        </button></a>
            
        </div>

<%@include file="rodape_franquiador.jsp"%>