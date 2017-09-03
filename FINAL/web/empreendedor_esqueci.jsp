<%-- 
    Document   : empreendedor_esqueci
    Created on : Jun 10, 2017, 12:33:47 AM
    Author     : paton
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@include file="cabecalho.jsp"%>
<div class="content-cadastrar nquebra">
<form action="empreendedor_esqueci_ok.jsp" method="post">

                <div class="mdl-cell--12-col"> 
                    <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                        <input class="mdl-textfield__input" type="text"    required   pattern="\d{11,11}"  maxlength="11" minlenght="11" name="cpf" />
                        <label class="mdl-textfield__label" for="cpf">CPF</label>
                        <span class="mdl-textfield__error">Digite um CPF</span>
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
<%@include file="rodape.jsp"%>