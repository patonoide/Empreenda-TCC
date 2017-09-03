<%-- 
    Document   : teste
    Created on : Mar 22, 2017, 3:37:27 PM
    Author     : paton
--%>


<%@page import="modelo.Categoria"%>
<%@page import="DAO.CategoriaDAO"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="modelo.Franquia"%>
<%@page import="DAO.FranquiaDAO"%>
<%@page import="DAO.FranquiadorDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%@include file="cabecalho.jsp"%>
<script src="mdl/material.min.js"></script>
<script src="mdl/jquery-2.1.4.min.js"></script>
<%@ page import = "java.io.*,java.util.*,javax.mail.*"%>
<%@ page import = "javax.mail.internet.*,javax.activation.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>


<button id="demo-show-snackbar" class="mdl-button mdl-js-button mdl-button--raised" type="button" style="display:none;">Show Snackbar</button>
<div id="demo-snackbar-example" class="mdl-js-snackbar mdl-snackbar">
    <div class="mdl-snackbar__text"></div>
    <button class="mdl-snackbar__action" type="button"></button>
</div>




<%
    CategoriaDAO gDAO = new CategoriaDAO();
    List<Categoria> gLista = gDAO.listar();
%>
<div class="content-login" >
    <form action="empreendedor_cadastrar_ok.jsp" method="post">

        <div class="mdl-cell--12-col"> 
            <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                <input class="mdl-textfield__input" type="text" required pattern="\d{11,11}"   maxlength="11" minlenght="11" title="Digite um CPF" name="txtCpf" />
                <label class="mdl-textfield__label" for="txtCpf">CPF</label>
                <span class="mdl-textfield__error">Digite um CPF</span>
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
                <input class="mdl-textfield__input" type="number" required  name="txtIdade" />
                <label class="mdl-textfield__label" for="txtIdade">Idade</label>
            </div>
        </div>
        <div class="mdl-cell--12-col"> 
            <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                <input class="mdl-textfield__input" type="number" required  name="txtDinheiro" />
                <label class="mdl-textfield__label" for="txtDinheiro">Quantidade disponível para investir</label>
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
        <label>Interesse</label>
        <select name="selCategoria" class="form-control" id="mostra">
            <option>Selecione</option>
            <%                        for (Categoria gen : gLista) {
            %>

            <option value="<%=gen.getIdcategoria()%>" data-descricao="<%=gen.getDescricao()%>" ><%=gen.getNome()%></option>

            <%
                }
            %>
        </select> 
        <br>
        <br>

        <br>
        <button type="submit" class="mdl-button mdl-js-button mdl-button--raised mdl-button--colored">
            Adicionar
        </button>
    </form>
</div>
<script>
    (function() {
    'use strict';
    var snackbarContainer = document.querySelector('#demo-snackbar-example');
    var showSnackbarButton = document.querySelector('#demo-show-snackbar');
        var $select = $('#mostra');
    var handler = function(event) {
      showSnackbarButton.style.backgroundColor = '';
    };
    $select.change(function () {
        
        var texto = $('#mostra option:selected').attr('data-descricao');
            'use strict';
            showSnackbarButton.style.backgroundColor = '#' +
                    Math.floor(Math.random() * 0xFFFFFF).toString(16);
            var data = {
                message: texto,
                timeout: 2000

            };
            snackbarContainer.MaterialSnackbar.showSnackbar(data);
        });
  }());
</script>
<%@include file="rodape.jsp"%>