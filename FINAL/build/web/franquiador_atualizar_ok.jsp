<%-- 
    Document   : franquiador_atualizar_ok
    Created on : Mar 27, 2017, 1:38:08 PM
    Author     : paton
--%>

<%@page import="modelo.Franquiador"%>
<%@page import="DAO.FranquiadorDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    if (request.getParameter("cnpj") == null || request.getParameter("cnpj").isEmpty()) {
        response.sendRedirect("franquiador_listar.jsp");
        return;
    }

    String msg="";
    String cnpj = request.getParameter("cnpj");
    String nome = request.getParameter("txtNome");
    String contato = request.getParameter("txtContato");
    String senha = request.getParameter("txtSenha");
    if(contato == null  || senha == null || nome== null || cnpj == null)
    {
        response.sendRedirect("franquiador_listar.jsp");
    }
    else
    {
    
        
        
        //Chamar a inclusão da DAO
        FranquiadorDAO dao = new FranquiadorDAO();
        
        Franquiador obj = new Franquiador();
        obj.setNome(nome);
        obj.setContato(contato);
        obj.setSenha(senha);
        obj.setCnpj(cnpj);
        try
        {
            dao.alterar(obj);
            msg = "Registro atualizado com sucesso";
        }
        catch(Exception ex)
        {
            msg = "Erro ao atualizar registro";
        }
        
    }
    
%>
<%@include file="cabecalho.jsp" %> 
 <div class="mdl-card__supporting-text content-login nquebra">
            <h4>Franquiador - Atualizado</h4>
            <p><%=msg%></p>
            <a href="login_empreendedor.jsp"> <button type="submit" class="mdl-button mdl-js-button mdl-button--raised mdl-button--colored">
            Login
        </button></a>
            
        </div>

<%@include file="rodape.jsp" %>