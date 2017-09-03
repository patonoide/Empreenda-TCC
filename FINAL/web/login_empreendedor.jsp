<%-- 
    Document   : login_empreendedor
    Created on : Mar 27, 2017, 1:19:33 PM
    Author     : paton
--%>

<%@page import="criptografia.Criptografia"%>
<%@page import="modelo.Empreendedor"%>
<%@page import="DAO.EmpreendedorDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    if(request.getParameter("sair") != null){
        
    session.setAttribute("empreendedor", null);
    }
    Criptografia c = new Criptografia();
    String mensagem="";
    if(request.getParameter("txtCpf")!= null && 
            request.getParameter("txtSenha")!= null)
    { 
        if(!request.getParameter("txtCpf").isEmpty() && !request.getParameter("txtSenha").isEmpty()){    
        EmpreendedorDAO dao = new EmpreendedorDAO();
        Empreendedor empreendedor;
        //variável com o usuário logado
        String cpf = request.getParameter("txtCpf");
        String senha =  request.getParameter("txtSenha");
        empreendedor = dao.realizarLogin(cpf, c.cripto(senha+c.cripto(c.cripto(senha))));
         if(empreendedor != null ){
             //Crio a sessão do usuário
            session.setAttribute("empreendedor", empreendedor);
            //redirecionar para a página inicial
            response.sendRedirect("empreendedor_meuperfil.jsp");
        }
        else{
            mensagem ="CPF ou Senha incorretos";
            
        }
    }
    }
%> 
<%@include file="cabecalho.jsp"%>
<div class="content-cadastrar" >
    <div class="mdl-grid">
        <div class="mdl-cell mdl-cell--6-col">
             <%=mensagem%>
            <form action="login_empreendedor.jsp" method="post">

                <div class="mdl-cell--12-col"> 
                    <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                        <input class="mdl-textfield__input" type="text" required pattern="\d{11,11}"   maxlength="11" minlenght="11" title="Digite um CPF" name="txtCpf" />
                        <label class="mdl-textfield__label" for="txtCpf">CPF</label>
                        <span class="mdl-textfield__error">Digite um CPF</span>
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
            </form>
            <br>
            <a href="empreendedor_esqueci.jsp"> <button type="submit" class="mdl-button mdl-js-button mdl-button--raised mdl-button--colored">
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
                        <a class="mdl-button mdl-button--colored mdl-js-button mdl-js-ripple-effect" href="empreendedor_cadastrar.jsp">
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
