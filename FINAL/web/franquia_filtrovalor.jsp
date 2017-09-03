<%-- 
    Document   : franquia_filtrovalor
    Created on : May 22, 2017, 5:32:30 PM
    Author     : paton
--%>

<%@page import="modelo.Franquiador"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="DAO.EmpreendedorDAO"%>
<%@page import="modelo.Empreendedor"%>
<%@page import="java.util.List"%>
<%@page import="modelo.Franquia"%>
<%@page import="modelo.Franquia"%>
<%@page import="DAO.FranquiaDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>


<%@include file="cabecalho_empreendedor.jsp"%>


<%    FranquiaDAO dao = new FranquiaDAO();
    EmpreendedorDAO daoe = new EmpreendedorDAO();
    String cpf = session.getAttribute("empreendedor").toString();
    Empreendedor obj = daoe.buscarPorChavePrimariaString(cpf);
    String nome = "";

    int cont = 0;
    DecimalFormat df = new DecimalFormat("###.#");
    if (request.getParameter("txtPesquisa") != null) {
        nome = request.getParameter("txtPesquisa");
    }
    List<Franquia> lista, listap;
    lista = null;

    listap = null;

    if (nome.isEmpty() == false) {
        listap = dao.filtroPesquisarValor(nome, obj.getDinheiro());

    } else {
        lista = dao.filtroValor(obj.getDinheiro());
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
<%     if (lista != null && listap == null && lista.isEmpty() == false) {
        for (Franquia item : lista) {

            cont++;

%>
<div class="content-super-cadastrar">

    <section class="section--center mdl-grid mdl-grid--no-spacing mdl-shadow--6dp card-perfil-imagem">
        <div class="mdl-card mdl-cell mdl-cell--12-col-desktop mdl-cell--6-col-tablet mdl-cell--4-col-phone">
            
            <div class="mdl-card__supporting-text mdl-grid">
                <div class="mdl-cell--6-col imagem-cima"><%if(item.getFoto()!=null){%><img src="arquivos/<%=item.getFoto()%>" alt="SEM IMAGEM" height="256" width="256"/><%}else{ %>
                    <img src="arquivos/anvil.png" alt="SEM IMAGEM" height="256" width="256"/>
                <%}%>
                    </div>
                     <div class="mdl-cell--6-col">
                <h4>Nome: <%=item.getNome()%></h4>

                <h6>Categoria: <%=item.getCategoriaListArrumado()%></h6>

                <h6>Valor inicial: R$ <%=df.format(item.getValorinicial())%></h6>
                <h6>Capital de Giro: R$ <%=item.getCapital()%></h6>
                <h6>Tempo até lucro(em meses): <%=item.getTempolucro()%></h6>
                <h6>Valor total: R$ <%=df.format(item.getValortotal())%></h6>
                     </div>
                <div class="mdl-card__menu">Opções
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
<%}
} else if (lista == null && listap != null && listap.isEmpty() == false) {%>
<%for (Franquia item : listap) {

        cont++;

%>
<div class="content-login">
    <section class="section--center mdl-grid mdl-grid--no-spacing mdl-shadow--6dp card-perfil-franquiador">
        <div class="mdl-card mdl-cell mdl-cell--12-col-desktop mdl-cell--6-col-tablet mdl-cell--4-col-phone">
            <div class="mdl-card__supporting-text">
                <h4>Nome: <%=item.getNome()%></h4>
                <h6>Categoria: <%=item.getCategoriaListArrumado()%></h6>

                <h6>Valor inicial: R$ <%=df.format(item.getValorinicial())%></h6>
                <h6>Capital de Giro: <%=item.getCapital()%></h6>
                <h6>Tempo até lucro(em meses): <%=item.getTempolucro()%></h6>
                <h6>Valor total: R$ <%=df.format(item.getValortotal())%></h6>

                <div class="mdl-card__menu">Opções
                    <button class="mdl-button mdl-js-button mdl-js-ripple-effect mdl-button--icon" id="<%=cont%>">
                        <i class="material-icons">monetization_on</i>
                    </button>
                    <ul class="mdl-menu mdl-js-menu mdl-menu--upper-right " for="<%=cont%>"> 

                        <li class="mdl-menu__item"><a href="email_ok.jsp?franquia=<%=item.getIdfranquia()%>">Mostrar Interesse</a></li>

                        <li class="mdl-menu__item"><a href="franquia_contato.jsp?id=<%=item.getIdfranquia()%>">Entrar em Contato</a></li>
                    </ul>

                </div>
            </div>
        </div>
    </section>
</div>
<br>
<%}
} else if (lista == null && listap != null && listap.isEmpty() == true) {%>
<div class=" mdl-card mdl-card-wide mdl-shadow--4dp  mdl-card__supporting-text content-cadastrar">
    <h2>Nada foi encrontado :( </h2>
</div>
<%} else if (lista != null && listap == null && lista.isEmpty() == true) {

%>
<div class=" mdl-card mdl-card-wide mdl-shadow--4dp  mdl-card__supporting-text content-cadastrar">
    <h2>Você ainda não tem nenhuma recomendação :( </h2>
</div>
<%}%>
<%@include file="rodape_empreendedor.jsp"%>
