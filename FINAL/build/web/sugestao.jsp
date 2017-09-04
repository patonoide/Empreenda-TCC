<%-- 
    Document   : sugestao
    Created on : 28/08/2017, 19:07:37
    Author     : Asus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    if (session.getAttribute("empreendedor") != null) {%>
<%@include file="cabecalho_empreendedor.jsp"%>
<%} else if (session.getAttribute("franquiador") != null) {%>
<%@include file="cabecalho_franquiador.jsp"%>
<%} else {%>
<%@include file="cabecalho.jsp"%>
<%}%>

<div class="content-login" >
    <form action="sugestao_ok.jsp" method="post">

        <div class="mdl-cell--12-col"> 
            <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                <input class="mdl-textfield__input" type="text" required  title="Digite seu nome" name="txtNome" />
                <label class="mdl-textfield__label" for="txtNome" > Nome</label>
                 <span class="mdl-textfield__error">Digite seu Nome</span>
            </div>
        </div>
      
        <div class="mdl-cell--12-col"> 
            <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                <textarea class="mdl-textfield__input" type="text" rows= "5" required  name="txtSugestao" ></textarea>
                <label class="mdl-textfield__label" for="txtSugestao">Sugestão</label>
            </div>
        </div>


        <div class="mdl-cell--12-col"> 
            <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                <input class="mdl-textfield__input" type="email"  required name="txtContato" >
                <label class="mdl-textfield__label" for="txtContato">E-mail</label>
            </div>
        </div>


        <div class="mdl-cell--12-col">

            <button type="submit" class="mdl-button mdl-js-button mdl-button--fab mdl-button--mini-fab mdl-button--colored">
                <i class="material-icons">save</i></button>
            <button type="reset" class="mdl-button mdl-js-button mdl-button--fab mdl-button--mini-fab mdl-button--colored">
                <i class="material-icons">clear</i></button>


        </div>
    </form>
</div>













<%
    if (session.getAttribute("empreendedor") != null) {%>
<%@include file="rodape_empreendedor.jsp"%>
<%} else if (session.getAttribute("franquiador") != null) {%>
<%@include file="rodape_franquiador.jsp"%>
<%} else {%>
<%@include file="rodape.jsp"%>
<%}%>
