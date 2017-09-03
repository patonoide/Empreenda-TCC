<%-- 
    Document   : franquia_cadastrar
    Created on : Mar 27, 2017, 1:38:54 PM
    Author     : paton
--%>

<%@page import="modelo.Franquiador"%>
<%@page import="java.util.List"%>
<%@page import="DAO.FranquiadorDAO"%>
<%@page import="modelo.Categoria"%>
<%@page import="DAO.CategoriaDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@include file="cabecalho_franquiador.jsp" %>
<%
    CategoriaDAO gDAO = new CategoriaDAO();
    List<Categoria> gLista = gDAO.listar();
   
     FranquiadorDAO dao = new FranquiadorDAO();

    String cnpj = session.getAttribute("franquiador").toString();
    Franquiador obj = dao.buscarPorChavePrimariaString(cnpj);
    String desc="";
%>


<button id="demo-show-snackbar" class="mdl-button mdl-js-button mdl-button--raised" type="button" style="display:none;">Show Snackbar</button>
<div id="demo-snackbar-example" class="mdl-js-snackbar mdl-snackbar">
    <div class="mdl-snackbar__text"></div>
    <button class="mdl-snackbar__action" type="button"></button>
</div>
<div class="content-login atualizar">
    <form action="franquia_cadastrar_ok.jsp" method="post">
        <div class="mdl-cell--12-col"> 
            <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                <input class="mdl-textfield__input" type="text" readonly value ="<%=obj.getCnpj()%>" name="txtFranquiador" />
                <label class="mdl-textfield__label" for="txtFranquiador">Franquiador</label>
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
                <input class="mdl-textfield__input" type="number" required  name="txtCapital" />
                <label class="mdl-textfield__label" for="txtCapital">Capital de Giro</label>
            </div>
        </div>
        <div class="mdl-cell--12-col"> 
            <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                <textarea class="mdl-textfield__input" type="text" rows= "5"  required name="txtDescricao" ></textarea>
                <label class="mdl-textfield__label" for="txtDescricao">Descricao</label>
            </div>
        </div>
       
        <div class="mdl-cell--12-col"> 
            <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                <input class="mdl-textfield__input" type="number" required  name="txtValorinicial" />
                <label class="mdl-textfield__label" for="txtValorinicial">Valor Inicial</label>
            </div>
        </div>
        <div class="mdl-cell--12-col"> 
            <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                <input class="mdl-textfield__input" type="number" required  name="txtTempo" />
                <label class="mdl-textfield__label" for="txtTempo">Tempo Até Lucro (em Meses)</label>
            </div>
        </div>
        <label>Categoria</label>
        <select name = "selCategoria" class="form-control" id="mostra">
            <option value="Selecione">Selecione</option>
            <%                        for (Categoria gen : gLista) {
            %>

            <option value="<%=gen.getIdcategoria()%>"> <%=gen.getNome()%> </option>

            <%desc=gen.getDescricao();
                }
            %>
        </select> 
       
       
        <br/>
        <br/>
        <button type="submit" class="mdl-button mdl-js-button mdl-button--raised mdl-button--colored">
            Adicionar
        </button>
    </form>
</div>
<script>
    (function () {
        'use strict';
        var snackbarContainer = document.querySelector('#demo-snackbar-example');
        var showSnackbarButton = document.querySelector('#demo-show-snackbar');
        var $select = $('#mostra');
        var handler = function (event) {
            showSnackbarButton.style.backgroundColor = '';
        };
        $select.change(function () {

            var texto = ("<%=desc%>");
            'use strict';
            showSnackbarButton.style.backgroundColor = '#' +
                    Math.floor(Math.random() * 0xFFFFFF).toString(16);
            var data = {
                message: texto,
                timeout: 3000

            };
            snackbarContainer.MaterialSnackbar.showSnackbar(data);
        });
    }());
</script>
<%@include file="rodape_franquiador.jsp"%>
