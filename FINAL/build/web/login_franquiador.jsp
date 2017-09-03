<%-- 
    Document   : login_franquiador
    Created on : Mar 27, 2017, 1:19:57 PM
    Author     : paton
--%>

<%@page import="criptografia.Criptografia"%>
<%@page import="modelo.Franquiador"%>
<%@page import="DAO.FranquiadorDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    if(request.getParameter("sair") != null){
        
    session.setAttribute("franquiador", null);
    }
    Criptografia c = new Criptografia();
    String mensagem="";
    if(request.getParameter("txtCnpj")!= null && 
            request.getParameter("txtSenha")!= null)
    { 
        if(!request.getParameter("txtCnpj").isEmpty() && !request.getParameter("txtSenha").isEmpty()){    
        FranquiadorDAO dao = new FranquiadorDAO();
        Franquiador franquiador;
        //variável com o usuário logado
        String cnpj = request.getParameter("txtCnpj");
        String senha =  request.getParameter("txtSenha");
        franquiador = dao.realizarLogin(cnpj, c.cripto(senha+c.cripto(c.cripto(senha))));
         if(franquiador != null ){
             //Crio a sessão do usuário
            session.setAttribute("franquiador", franquiador);
            //redirecionar para a página inicial
            response.sendRedirect("franquiador_meuperfil.jsp");
        }
        else{
            mensagem ="CNPJ ou Senha incorretos";
            
        }
    }
    }
%> 
<%@include file="cabecalho.jsp"%>
<div class="content-cadastrar" >
    <div class="mdl-grid">
       
        <div class="mdl-cell mdl-cell--6-col">
             <%=mensagem%>
            <form action="login_franquiador.jsp" method="post">

                <div class="mdl-cell--12-col"> 
                    <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                        <input class="mdl-textfield__input" type="text" required pattern="\d{14,14}"  maxlength="14" minlenght="14" title="Digite um CNPJ" name="txtCnpj" />
                        <label class="mdl-textfield__label" for="txtCnpj">CNPJ</label>
                        <span class="mdl-textfield__error">Digite um CNPJ</span>
                    </div>
                </div>
                <div class="mdl-cell--12-col"> 
                    <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                        <input class="mdl-textfield__input" type="password" required  name="txtSenha" />
                        <label class="mdl-textfield__label" for="txtSenha">Senha</label>
                    </div>
                </div>
                <div class="mdl-cell--12-col">

                    <button type="submit" class="mdl-button mdl-js-button mdl-button--fab mdl-button--mini-fab mdl-button--colored">
                        <i class="material-icons">save</i></button>
                    <button type="reset" class="mdl-button mdl-js-button mdl-button--fab mdl-button--mini-fab mdl-button--colored">
                        <i class="material-icons">clear</i></button>


                </div>
                <br>
            </form>
            <a href="franquiador_esqueci.jsp"> <button type="submit" class="mdl-button mdl-js-button mdl-button--raised mdl-button--colored">
            Esqueci minha senha.
        </button></a>
        </div>

        <div class="mdl-cell mdl-cell--4-col">
            <div class="snippet-demo">





                <div class="demo-card-event mdl-card mdl-shadow--2dp">
                    <div class="mdl-card__title mdl-card--expand">
                        <h4>
                            <br>
                            <br>
                            Faça Login ou cadastre-se

                        </h4>
                    </div>
                    <div class="mdl-card__actions mdl-card--border">
                        <a class="mdl-button mdl-button--colored mdl-js-button mdl-js-ripple-effect" href="franquiador_cadastrar.jsp">
                            Cadastrar
                        </a>
                        <div class="mdl-layout-spacer"></div>

                    </div>
                </div>
            </div>
        </div>
    </div>
</div>





<%@include file="rodape.jsp"%>
