<%-- 
    Document   : franquiador_adicionar
    Created on : Apr 13, 2017, 1:33:56 PM
    Author     : paton
--%>

<%@page import="java.util.List"%>
<%@page import="DAO.CategoriaDAO"%>
<%@page import="modelo.Categoria"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="cabecalho_admin.jsp" %>

<div class="content-login atualizar">
    <form action="franquiador_adicionar_ok.jsp" method="post">

        <div class="mdl-cell--12-col"> 
            <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                <input class="mdl-textfield__input" type="number" required  name="txtCnpj" />
                <label class="mdl-textfield__label" for="txtCnpj">CNPJ</label>
            </div>
        </div>
        <div class="mdl-cell--12-col"> 
            <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                <input class="mdl-textfield__input" type="text" required  name="txtNome" />
                <label class="mdl-textfield__label" for="txtNome">Nome</label>
            </div>
        </div>
       
        <div class="mdl-cell--12-col"> 
            <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                <input class="mdl-textfield__input" type="email"  required name="txtContato" >
                <label class="mdl-textfield__label" for="txtContato">E-mail</label>
            </div>
        </div>
        <div class="mdl-cell--12-col"> 
            <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                <input class="mdl-textfield__input" type="text" required  name="txtSenha" />
                <label class="mdl-textfield__label" for="txtSenha">Senha</label>
            </div>
        </div>
        
        <button type="submit" class="mdl-button mdl-js-button mdl-button--raised mdl-button--colored">
            Adicionar
        </button>
    </form>
</div>

<%@include file="rodape.jsp"%>