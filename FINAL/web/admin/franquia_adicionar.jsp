<%-- 
    Document   : franquia_cadastrar
    Created on : Apr 19, 2017, 4:12:14 PM
    Author     : paton
--%>
<%@page import="modelo.Franquiador"%>
<%@page import="DAO.FranquiadorDAO"%>
<%@page import="java.util.List"%>
<%@page import="modelo.Categoria"%>
<%@page import="DAO.CategoriaDAO"%>
<%
    CategoriaDAO gDAO = new CategoriaDAO();
    List<Categoria> gLista = gDAO.listar();
    FranquiadorDAO fDAO = new FranquiadorDAO();
    List<Franquiador> fLista = fDAO.listar();
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="cabecalho_admin.jsp" %>
<div class="content-login atualizar">
    <form action="franquia_adicionar_ok.jsp" method="post">

        <div class="mdl-cell--12-col"> 
            <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                <input class="mdl-textfield__input" type="text" required  name="txtNome" />
                <label class="mdl-textfield__label" for="txtNome">Nome</label>
            </div>
        </div>
        <div class="mdl-cell--12-col"> 
            <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                <input class="mdl-textfield__input" type="text" required  name="txtCapital" />
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
                <input class="mdl-textfield__input" type="text" required  name="txtValorinicial" />
                <label class="mdl-textfield__label" for="txtValorinicial">Valor Inicial</label>
            </div>
        </div>
        <div class="mdl-cell--12-col"> 
            <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                <input class="mdl-textfield__input" type="text" required  name="txtTempo" />
                <label class="mdl-textfield__label" for="txtTempo">Tempo Até Lucro</label>
            </div>
        </div>
        <label>Categoria</label>
        <select name = "selCategoria" class="form-control">
            <option>Selecione</option>
            <%                        for (Categoria gen : gLista) {
            %>

            <option value="<%=gen.getIdcategoria()%>" > <%=gen.getNome()%> </option>

            <%
                }
            %>
        </select> 
        <br/>
        <br/>
        <label>Franquiador</label>
        <select name = "selFranquiador" class="form-control">
            <option>Selecione</option>
            <%
                for (Franquiador f : fLista) {
            %>

            <option value="<%=f.getCnpj()%>" > <%=f.getNome()%> </option>

            <%
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

<%@include file="rodape.jsp"%>
