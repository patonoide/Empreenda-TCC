<%-- 
    Document   : franquia_contato
    Created on : Apr 19, 2017, 3:53:25 PM
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
    String id = request.getParameter("id");
    Franquia obj;
    obj = dao.buscarPorChavePrimaria(Integer.parseInt(id));
    DecimalFormat df = new DecimalFormat("###.#");

%>
<div class="content-perfil">
    <section class="section--center mdl-grid  mdl-shadow--6dp card-perfil-imagem">
        <div class="   mdl-card mdl-cell mdl-cell--12-col-desktop mdl-cell--6-col-tablet mdl-cell--4-col-phone">

            <div class="mdl-card__supporting-text mdl-grid">
                <div class="mdl-cell--6-col imagem-cima"><%if (obj.getFoto() != null) {%><img src="arquivos/<%=obj.getFoto()%>" alt="SEM IMAGEM" height="256" width="256"/><%} else { %>
                    <img src="arquivos/anvil.png" alt="SEM IMAGEM" height="256" width="256"/>
                    <%}%></div>
                <div class="mdl-cell--6-col">
                    <div class="mdl-card__supporting-text">
                        <h4>Nome: <%=obj.getNome()%></h4>
                        <h6>CNPJ do Franquiador: <%=obj.getFranquiador().getCnpj()%></h6>
                        <h6>Nome do Franquiador: <%=obj.getFranquiador().getNome()%></h6>
                        <h6>Categoria: <%=obj.getCategoriaListArrumado()%></h6>
                        <h6>Descrição: <%=obj.getDescricao()%></h6>
                        <h6>Valor inicial: <%=df.format(obj.getValorinicial())%></h6>
                        <h6>Capital de Giro: <%=obj.getCapital()%></h6>
                        <h6>Tempo até lucro(em meses): <%=obj.getTempolucro()%></h6>
                        <h6>Valor total: <%=df.format(obj.getValortotal())%></h6>
                        <h6>Contato do Franquiador: <%=obj.getFranquiador().getContato()%></h6>
                    </div>
                    <% if (session.getAttribute("empreendedor") != null) {%>
                    <div class="mdl-card__menu">
                        <button class="mdl-button mdl-js-button mdl-js-ripple-effect mdl-button--icon" id="btn">
                            <i class="material-icons">monetization_on</i>
                        </button>
                        <ul class="mdl-menu mdl-js-menu mdl-menu--upper-right " for="btn">

                            <li class="mdl-menu__item"><a href="email_ok.jsp?franquia=<%=obj.getIdfranquia()%>">Mostrar Interesse</a></li>




                        </ul>

                    </div>
                    <%}%>  

                </div>
            </div>
        </div>


    </section>

</div> 
<% if (session.getAttribute("empreendedor") != null) {%>
<%@include file="rodape_empreendedor.jsp"%>
<%} else if (session.getAttribute("franquiador") != null) {%>
<%@include file="rodape_franquiador.jsp"%>
<%} else {%>
<%@include file="rodape.jsp"%>
<%}%>