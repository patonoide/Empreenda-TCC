<%@page import="java.util.List"%>
<%@page import="modelo.Categoria"%>
<%@page import="DAO.CategoriaDAO"%>
<%@include file="cabecalho.jsp"%>
<%
    CategoriaDAO gDAO = new CategoriaDAO();
    List<Categoria> gLista = gDAO.listar();
    String desc = "";
%>
<button id="demo-show-snackbar" class="mdl-button mdl-js-button mdl-button--raised" type="button" style="display:none;">Show Snackbar</button>
<div id="demo-snackbar-example" class="mdl-js-snackbar mdl-snackbar">
    <div class="mdl-snackbar__text"></div>
    <button class="mdl-snackbar__action" type="button"></button>
</div>

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
        <select name="selCategoria" class="form-control" id="mostra" required>
            <option  value="Selecione"> Selecione</option>
            <%                        for (Categoria gen : gLista) {
            %>

            <option value="<%=gen.getIdcategoria()%>"  ><%=gen.getNome()%></option>

            <%desc = gen.getDescricao();
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

<%@include file="rodape.jsp"%>