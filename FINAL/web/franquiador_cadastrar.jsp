<%@include file="cabecalho.jsp"%>
<div class="content-login" >
    <form action="franquiador_cadastrar_ok.jsp" method="post">

        <div class="mdl-cell--12-col"> 
            <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                <input class="mdl-textfield__input" type="text" required pattern="\d{14,14}"  maxlength="14" minlenght="14" title="Digite um CNPJ" name="txtCnpj" />
                <label class="mdl-textfield__label" for="txtCnpj">CNPJ</label>
                 <span class="mdl-textfield__error">Digite um CNPJ</span>
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
                <input class="mdl-textfield__input" type="text" required  name="txtSenha" />
                <label class="mdl-textfield__label" for="txtSenha">Senha</label>
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
<br>
<%@include file="rodape.jsp"%>