<%-- 
    Document   : empreendedor_adicionar
    Created on : Apr 19, 2017, 4:13:54 PM
    Author     : paton
--%>

<%@page import="java.util.List"%>
<%@page import="modelo.Categoria"%>
<%@page import="modelo.Categoria"%>
<%@page import="DAO.CategoriaDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="cabecalho_admin.jsp" %>
<%    CategoriaDAO gDAO = new CategoriaDAO();
    List<Categoria> gLista = gDAO.listar();
%>
<div class="content-login atualizar">
    <form action="empreendedor_adicionar_ok.jsp" method="post">

        <div class="mdl-cell--12-col"> 
            <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                <input class="mdl-textfield__input" type="number" required  name="txtCpf" />
                <label class="mdl-textfield__label" for="txtCpf">CPF</label>
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
                <label class="mdl-textfield__label" for="txtDinheiro">Dinheiro</label>
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
        <select name = "selCategoria" class="form-control">
            <option>Selecione</option>
            <%                        for (Categoria gen : gLista) {
            %>

            <option value="<%=gen.getIdcategoria()%>" > <%=gen.getNome()%> </option>

            <%
                }
            %>
        </select> 
        <br>
        <br>
        <button type="submit" class="mdl-button mdl-js-button mdl-button--raised mdl-button--colored">
            Adicionar
        </button>
    </form>
</div>

<%@include file="rodape.jsp"%>
