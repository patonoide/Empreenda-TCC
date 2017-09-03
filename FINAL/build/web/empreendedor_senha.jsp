<%-- 
    Document   : empreendedor_senha
    Created on : 26/07/2017, 23:31:57
    Author     : Asus
--%>

<%@include file="cabecalho_empreendedor.jsp"%>
<div class="content-login" >
    <form action="empreendedor_senha_ok.jsp" method="post">

        
     
        <div class="mdl-cell--12-col"> 
            <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                <input class="mdl-textfield__input" type="text" required  name="txtSenhaatual" />
                <label class="mdl-textfield__label" for="txtSenhaatual">Senha Atual</label>
            </div>
        </div>
        
         <div class="mdl-cell--12-col"> 
            <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                <input class="mdl-textfield__input" type="text" required  name="txtSenhanova" />
                <label class="mdl-textfield__label" for="txtSenhanova">Senha Nova</label>
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
<br>
<%@include file="rodape_empreendedor.jsp"%>
