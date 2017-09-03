<%@page import="java.util.List"%>
<%@page import="DAO.CategoriaDAO"%>
<%@page import="modelo.Categoria"%>
<%@page import="modelo.Empreendedor"%>
<%@page import="DAO.EmpreendedorDAO"%>
<%@include file="cabecalho_empreendedor.jsp"%>
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
        response.sendRedirect("login_empreendedor.jsp");
        return;
    }
    Categoria cat = gDAO.buscarPorChavePrimaria(obj.getCategoriaListId());
%>
<button id="demo-show-snackbar" class="mdl-button mdl-js-button mdl-button--raised" type="button" style="display:none;">Show Snackbar</button>
<div id="demo-snackbar-example" class="mdl-js-snackbar mdl-snackbar">
    <div class="mdl-snackbar__text"></div>
    <button class="mdl-snackbar__action" type="button"></button>
</div>

<div class="content-login atualizar">
    <form action="empreendedor_atualizar_ok.jsp" method="post">

        <div class="mdl-cell--12-col"> 
            <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                <input class="mdl-textfield__input" type="number" readonly  value ="<%=obj.getCpf()%>" pattern="\d{11,11}"  maxlength="11" minlenght="11" name="txtCpf" />
                <label class="mdl-textfield__label" for="txtCpf">CPF</label>
            </div>
        </div>
        <div class="mdl-cell--12-col hidden"> 
            <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                <input class="mdl-textfield__input" type="text" readonly  value ="<%=obj.getSenha()%>"  name="txtSenha" />
                <label class="mdl-textfield__label" for="txtSenha"><%=obj.getSenha()%></label>
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
                <label class="mdl-textfield__label" for="txtDinheiro">Quantidade disponível para investir</label>
            </div>
        </div>

        <div class="mdl-cell--12-col"> 
            <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                <input class="mdl-textfield__input"  type="email"  required name="txtContato" value="<%=obj.getContato()%> ">
                <label class="mdl-textfield__label" for="txtContato">E-mail</label>
            </div>
        </div>
       
        <label>Interesse</label>
        <select name = "selCategoria" class="form-control" id="mostra">
            <option value="<%=obj.getCategoriaListId()%>" data-descricao="<%=cat.getDescricao() %>"> <%=obj.getCategoriaListArrumado()%> </option>

            <%                        for (Categoria gen : gLista) {
                    if (gen.getIdcategoria() != obj.getCategoriaListId()) {
            %>

            <option value="<%=gen.getIdcategoria()%>" data-descricao="<%=gen.getDescricao()%>"> <%=gen.getNome()%> </option>

            <%
                    }
                }
            %>
        </select> 
        <br>
        <br>
        <button type="submit" class="mdl-button mdl-js-button mdl-button--raised mdl-button--colored">
            Atualizar
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

            var texto = $('#mostra option:selected').attr('data-descricao');
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

<%@include file="rodape_empreendedor.jsp"%>
