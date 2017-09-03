<%-- 
    Document   : franquia_atualizar
    Created on : Apr 19, 2017, 4:13:23 PM
    Author     : paton
--%>

<%@page import="modelo.Franquia"%>
<%@page import="DAO.FranquiaDAO"%>
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
    
if (request.getParameter("id") == null) {
        response.sendRedirect("franquiador_listar.jsp");
    }

    String id = request.getParameter("id");
    

    FranquiaDAO DAO = new FranquiaDAO();
    //buscar o registro pela chave primária
    Franquia obj = DAO.buscarPorChavePrimaria(Integer.parseInt(id));
    Franquiador fobj = fDAO.buscarPorChavePrimariaString(obj.getFranquiador().getCnpj());
    if (obj == null) {
        response.sendRedirect("franquiador_listar.jsp");
        return;
    }
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="cabecalho_admin.jsp" %>
<div class="content-login atualizar">
    <form action="franquia_atualizar_ok.jsp" method="post">
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
             <option value="<%=obj.getCategoriaListId()%>" > <%=obj.getCategoriaListArrumado()%> </option>

            <%                        for (Categoria gen : gLista) {
                           if(gen.getIdcategoria()!=obj.getCategoriaListId()){
            %>

            <option value="<%=gen.getIdcategoria()%>" > <%=gen.getNome()%> </option>

            <%
               }}
            %>
        </select> 
        <br/>
        <br/>
        <label>Franquiador</label>
        <select name = "selFranquiador" class="form-control">
             <option value="<%=obj.getFranquiador().getCnpj()%>" > <%=obj.getFranquiador().getNome()%> </option>
            <%
                for (Franquiador f : fLista) {
                     if(f.getCnpj()!=obj.getFranquiador().getCnpj()){
            %>

            <option value="<%=f.getCnpj()%>" > <%=f.getNome()%> </option>

            <%
                }}
            %>
        </select> 
        <br/>
        <br/>
      <div class="mdl-cell--12-col"> 
            <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                <input class="mdl-textfield__input" type="text" readonly value="<%=obj.getFoto()%>" name="txtFoto" />
                <label class="mdl-textfield__label" for="txtFoto">URL Foto</label>
            </div>
        </div>
        <br/>
        <br/>
        <button type="submit" class="mdl-button mdl-js-button mdl-button--raised mdl-button--colored">
            Atualizar
        </button>
    </form>
</div>

<%@include file="rodape.jsp"%>
