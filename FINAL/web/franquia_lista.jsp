<%-- 
    Document   : franquia_lista
    Created on : Mar 27, 2017, 3:30:00 PM
    Author     : paton
--%>

<%@page import="java.text.DecimalFormat"%>
<%@page import="java.util.List"%>
<%@page import="modelo.Franquia"%>
<%@page import="DAO.FranquiaDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    if (session.getAttribute("empreendedor") != null) {%>
<%@include file="cabecalho_empreendedor.jsp"%>
<%} else if (session.getAttribute("franquiador") != null) {%>
<%@include file="cabecalho_franquiador.jsp"%>
<%} else {%>
<%@include file="cabecalho.jsp"%>
<%}%>
<%
    FranquiaDAO dao = new FranquiaDAO();
    DecimalFormat df = new DecimalFormat("###.#");
    String nome = "";
    if (request.getParameter("txtPesquisa") != null) {
        nome = request.getParameter("txtPesquisa");
    }
    List<Franquia> lista;
    int cont = 0;
    if (!nome.isEmpty()) {
        lista = dao.filtroPesquisar(nome);
        
    } else {
        lista = dao.listar();
    }

%>
<div class="content-login">
    <form action="#">
        <div class="mdl-textfield mdl-js-textfield mdl-textfield--expandable">
            <label class="mdl-button mdl-js-button mdl-button--icon" for="sample6">
                <i class="material-icons">search</i>
            </label>
            <div class="mdl-textfield__expandable-holder">
                <input class="mdl-textfield__input" type="text" name="txtPesquisa" id="sample6">
                <label class="mdl-textfield__label" for="txtPesquisa">Expandable Input</label>
            </div>
        </div>
    </form>
</div>
<%  if(lista.isEmpty()!=true){
    for (Franquia item : lista) {

        cont++;
%>
<div class="content-super-cadastrar padding">

    <section class="section--center  mdl-grid  mdl-shadow--6dp card-perfil-imagem">
        <div class="mdl-cell--12-col-desktop mdl-cell--4-col-phone mdl-card mdl-cell--6-col-tablet">
            
            <div class="mdl-card__supporting-text mdl-grid ">
                <div class="mdl-cell--6-col-desktop mdl-cell--4-col-phone imagem-cima"><%if(item.getFoto()!=null){%><img src="arquivos/<%=item.getFoto()%>" alt="SEM IMAGEM" height="256" width="256"/><%}else{ %>
                    <img src="arquivos/anvil.png" alt="SEM IMAGEM" height="256" width="256"/>
                <%}%>
                    </div>
                     <div class="mdl-cell--6-col mdl-cell--4-col-phone">
                <h4>Nome: <%=item.getNome()%></h4>

                <h6>Categoria: <%=item.getCategoriaListArrumado()%></h6>

                <h6>Valor inicial: R$ <%=df.format(item.getValorinicial())%></h6>
                <h6>Capital de Giro: R$ <%=item.getCapital()%></h6>
                <h6>Tempo até lucro(em meses): <%=item.getTempolucro()%></h6>
                <h6>Valor total: R$ <%=df.format(item.getValortotal())%></h6>
                     </div>
                <div class="mdl-card__menu">
                    Opções
                    <button class="mdl-button mdl-js-button mdl-js-ripple-effect mdl-button--icon" id="<%=cont%>">
                        <i class="material-icons">monetization_on</i>
                    </button>
                    <ul class="mdl-menu mdl-js-menu mdl-menu--upper-right " for="<%=cont%>">
                        <% if(session.getAttribute("empreendedor")!=null) {%>
                        <li class="mdl-menu__item"><a href="email_ok.jsp?franquia=<%=item.getIdfranquia()%>">Mostrar Interesse</a></li>
                        <%}%>
                        <li class="mdl-menu__item"><a href="franquia_contato.jsp?id=<%=item.getIdfranquia()%>">Mais informações</a></li>
                    </ul>

                </div>
            </div>
        </div>
                    
    </section>
</div>
<br>
<%}}else{%>
<div class=" mdl-card mdl-card-wide mdl-shadow--4dp  mdl-card__supporting-text content-cadastrar">
    <h2>Nenhuma franquia foi encontrada :( </h2>
</div>

<%}%>
<%
    if (session.getAttribute("empreendedor") != null) {%>
<%@include file="rodape_empreendedor.jsp"%>
<%} else if (session.getAttribute("franquiador") != null) {%>
<%@include file="rodape_franquiador.jsp"%>
<%} else {%>
<%@include file="rodape.jsp"%>
<%}%>
