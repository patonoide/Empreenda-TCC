<%-- 
    Document   : franquia_atualizar
    Created on : Mar 27, 2017, 1:39:14 PM
    Author     : paton
--%>

<%@page import="modelo.Franquia"%>
<%@page import="DAO.FranquiaDAO"%>
<%@page import="modelo.Franquiador"%>
<%@page import="java.util.List"%>
<%@page import="DAO.FranquiadorDAO"%>
<%@page import="modelo.Categoria"%>
<%@page import="DAO.CategoriaDAO"%>
<%
    CategoriaDAO gDAO = new CategoriaDAO();
    List<Categoria> gLista = gDAO.listar();
    FranquiadorDAO fDAO = new FranquiadorDAO();
    List<Franquiador> fLista = fDAO.listar();
    String cnpj = session.getAttribute("franquiador").toString();
    if (request.getParameter("id") == null) {
        response.sendRedirect("franquiador_minhas_franquias.jsp");
    }

    String id = request.getParameter("id");

    FranquiaDAO dao = new FranquiaDAO();
    //buscar o registro pela chave primária
    Franquia obj = dao.buscarPorChavePrimaria(Integer.parseInt(id));
    if (Long.parseLong(obj.getFranquiador().getCnpj()) != Long.parseLong(cnpj)) {
        response.sendRedirect("franquiador_meuperfil.jsp");

    }
    if (obj == null) {
        response.sendRedirect("franquiador_listar.jsp");
        return;
    }
    Categoria cat = gDAO.buscarPorChavePrimaria(obj.getCategoriaListId());
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<button id="demo-show-snackbar" class="mdl-button mdl-js-button mdl-button--raised" type="button" style="display:none;">Show Snackbar</button>
<div id="demo-snackbar-example" class="mdl-js-snackbar mdl-snackbar">
    <div class="mdl-snackbar__text"></div>
    <button class="mdl-snackbar__action" type="button"></button>
</div>

<%@include file="cabecalho_franquiador.jsp" %>
<div class="content-login atualizar">
    <form action="franquia_atualizar_ok.jsp" method="post">
        <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
            <input class="mdl-textfield__input"  readonly  value="<%=obj.getFranquiador().getCnpj()%>" name="cnpj" />
            <label class="mdl-textfield__label" for="cnpj">CNPJ</label>
        </div>
        <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
            <input class="mdl-textfield__input"  readonly  value="<%=obj.getIdfranquia()%>" name="id" />
            <label class="mdl-textfield__label" for="id">ID</label>
        </div>
        <div class="mdl-cell--12-col"> 
            <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                <input class="mdl-textfield__input" type="text" required  value= "<%=obj.getNome()%>" name="txtNome" />
                <label class="mdl-textfield__label" for="txtNome">Nome</label>
            </div>
        </div>
        <div class="mdl-cell--12-col"> 
            <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                <input class="mdl-textfield__input" type="text" required  value="<%=obj.getCapital()%>" name="txtCapital" />
                <label class="mdl-textfield__label" for="txtCapital">Capital de Giro</label>
            </div>
        </div>
        <div class="mdl-cell--12-col"> 
            <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                <textarea class="mdl-textfield__input" rows= "5" required name="txtDescricao" ><%=obj.getDescricao()%></textarea>
                <label class="mdl-textfield__label" for="txtDescricao">Descricao</label>
            </div>
        </div>

        <div class="mdl-cell--12-col"> 
            <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                <input class="mdl-textfield__input" type="text" required  value="<%=obj.getValorinicial()%>" name="txtValorinicial" />
                <label class="mdl-textfield__label" for="txtValorinicial">Valor Inicial</label>
            </div>
        </div>
        <div class="mdl-cell--12-col"> 
            <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                <input class="mdl-textfield__input" type="text" required value="<%=obj.getTempolucro()%>" name="txtTempo" />
                <label class="mdl-textfield__label" for="txtTempo">Tempo Até Lucro</label>
            </div>
        </div>
        <label>Categoria</label>
        <select name = "selCategoria" class="form-control" >
            <option value="<%=obj.getCategoriaListId()%>" data-descricao="<%=cat.getDescricao()%>"> <%=obj.getCategoriaListArrumado()%> </option>

            <%                        for (Categoria gen : gLista) {
                    if (gen.getIdcategoria() != obj.getCategoriaListId()) {
            %>

            <option value="<%=gen.getIdcategoria()%>" data-descricao="<%=gen.getDescricao()%>"> <%=gen.getNome()%> </option>

            <%
                    }
                }
            %>
        </select> 
        <br/>
        <br/>
        <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label hidden">
            <input class="mdl-textfield__input"  readonly  value="<%=obj.getFoto() %>" name="txtFoto" />
            <label class="mdl-textfield__label" for="txtFoto">Foto</label>
        </div>
        <br/>
        <br/>
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
<%@include file="rodape_franquiador.jsp"%>