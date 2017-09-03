<%-- 
    Document   : empreendedor_atualizar
    Created on : Apr 19, 2017, 4:14:20 PM
    Author     : paton
--%>

<%@page import="modelo.Empreendedor"%>
<%@page import="DAO.EmpreendedorDAO"%>
<%@page import="DAO.FranquiadorDAO"%>
<%@page import="java.util.List"%>
<%@page import="modelo.Categoria"%>
<%@page import="DAO.CategoriaDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@include file="cabecalho_admin.jsp" %>
<%    CategoriaDAO gDAO = new CategoriaDAO();
    List<Categoria> gLista = gDAO.listar();
     if (request.getParameter("id") == null) {
        response.sendRedirect("franquiador_listar.jsp");
    }

    String id = request.getParameter("id");
    

    EmpreendedorDAO DAO = new EmpreendedorDAO();
    //buscar o registro pela chave primária
    Empreendedor obj = DAO.buscarPorChavePrimariaString(id);
    if (obj == null) {
        response.sendRedirect("empreendedor_listar.jsp");
        return;
    }
%>
<div class="content-login atualizar">
    <form action="empreendedor_atualizar_ok.jsp" method="post">

        <div class="mdl-cell--12-col"> 
            <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                <input class="mdl-textfield__input" type="number" readonly  value ="<%=obj.getCpf()%>" name="txtCpf" />
                <label class="mdl-textfield__label" for="txtCpf">CPF</label>
            </div>
        </div>
        <div class="mdl-cell--12-col"> 
            <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                <input class="mdl-textfield__input" type="text" required   value= "<%=obj.getNome()%>" name="txtNome" />
                <label class="mdl-textfield__label" for="txtNome">Nome</label>
            </div>
        </div>
        <div class="mdl-cell--12-col"> 
            <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                <input class="mdl-textfield__input" type="number" required   value = "<%=obj.getIdade()%>"name="txtIdade" />
                <label class="mdl-textfield__label" for="txtIdade">Idade</label>
            </div>
        </div>
        <div class="mdl-cell--12-col"> 
            <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                <input class="mdl-textfield__input" type="number" required   value = "<%=obj.getDinheiro()%>"name="txtDinheiro" />
                <label class="mdl-textfield__label" for="txtDinheiro">Dinheiro</label>
            </div>
        </div>

      
        <div class="mdl-cell--12-col"> 
            <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                <input class="mdl-textfield__input" type="email"  required value="<%=obj.getContato() %>" name="txtContato" >
                <label class="mdl-textfield__label" for="txtContato">E-mail</label>
            </div>
        </div>
        <div class="mdl-cell--12-col"> 
            <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                <input class="mdl-textfield__input" type="text" required  value = "<%=obj.getSenha()%>"name="txtSenha" />
                <label class="mdl-textfield__label" for="txtSenha">Senha</label>
            </div>
        </div>
        <label>Interesse</label>
        <select name = "selCategoria" class="form-control" >
             <option value="<%=obj.getCategoriaListId()%>" > <%=obj.getCategoriaListArrumado()%> </option>

            <%                        for (Categoria gen : gLista) {
                           if(gen.getIdcategoria()!=obj.getCategoriaListId()){
            %>

            <option value="<%=gen.getIdcategoria()%>" > <%=gen.getNome()%> </option>

            <%
               }}
            %>
        </select> 
        <br>
        <br>
        <button type="submit" class="mdl-button mdl-js-button mdl-button--raised mdl-button--colored">
            Atualizar
        </button>
    </form>
</div>

<%@include file="rodape.jsp"%>
