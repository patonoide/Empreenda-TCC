<%-- 
    Document   : categoria_adicionar_ok
    Created on : Apr 7, 2017, 6:57:50 PM
    Author     : paton
--%>

<%@page import="modelo.Categoria"%>
<%@page import="DAO.CategoriaDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@include file="cabecalho_admin.jsp" %> 
<%
    String msg="";
    
    String nome = request.getParameter("txtNome");
    String descricao = request.getParameter("txtDescricao");
    if(descricao ==null || nome == null)
    {
        response.sendRedirect("list.jsp");
    }
    else
    {
    
        
        
        //Chamar a inclusão da DAO
        CategoriaDAO dao = new CategoriaDAO();
        
        Categoria obj = new Categoria();
        obj.setNome(nome);
        obj.setDescricao(descricao);
        
        try
        {
            dao.incluir(obj);
            msg = "Registro cadastrado com sucesso";
        }
        catch(Exception ex)
        {
            msg = "Erro ao cadastrar registro";
        }
        
    }
    
%>
<section class="section--center mdl-grid mdl-grid--no-spacing mdl-shadow--2dp">
    <div class="mdl-card mdl-cell mdl-cell--12-col">
        <div class="mdl-card__supporting-text ">
            <h4>Categoria - Cadastrar</h4>
            <p><%=msg%></p>
            <a href="categoria_listar.jsp"><i class="material-icons">list</i></a>
            
        </div>

    </div>

</section>
<%@include file="rodape.jsp"%>
