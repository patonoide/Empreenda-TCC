<%-- 
    Document   : categoria_adicionar
    Created on : Apr 7, 2017, 6:57:38 PM
    Author     : paton
--%>
<%@include file="cabecalho_admin.jsp" %> 
<div class="content-login">
    <form action="categoria_adicionar_ok.jsp" method="post">

        <div class="mdl-cell--12-col"> 
            <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                <input class="mdl-textfield__input" type="text" required  name="txtNome" />
                <label class="mdl-textfield__label" for="txtNome">Nome</label>
            </div>
        </div>
        <div class="mdl-cell--12-col"> 
            <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                <textarea class="mdl-textfield__input" type="text" rows= "5"  required name="txtDescricao" ></textarea>
                <label class="mdl-textfield__label" for="txtDescricao">Descricao</label>
            </div>
        </div>
        <button type="submit" class="mdl-button mdl-js-button mdl-button--raised mdl-button--colored">
            Adicionar
        </button>
    </form>
</div>
<%@include file="rodape.jsp"%>