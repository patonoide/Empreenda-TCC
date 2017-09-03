<%-- 
    Document   : franquiador_minhas_franquias
    Created on : May 28, 2017, 12:46:27 PM
    Author     : paton
--%>

<%@page import="java.text.DecimalFormat"%>
<%@page import="java.util.List"%>
<%@page import="modelo.Franquia"%>
<%@page import="DAO.FranquiaDAO"%>
<%@page contentType="text/html"  pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@include file="cabecalho_franquiador.jsp"%>

<%    String cnpj = request.getParameter("cnpj");
    FranquiaDAO dao = new FranquiaDAO();
    List<Franquia> lista;
    lista = dao.listarPorFranquiador(cnpj);
    int cont = 0;
    
    DecimalFormat df = new DecimalFormat("###.#");
%>

<%  if (lista.isEmpty()== false) {
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
                       
                        <li class="mdl-menu__item"><a href="franquia_contato.jsp?id=<%=item.getIdfranquia()%>">Mais informações</a></li>
                         <li class="mdl-menu__item"><a href="franquia_imagem.jsp?id=<%=item.getIdfranquia()%>">Modificar Imagem</a></li>
                          <li class="mdl-menu__item"><a href="franquia_atualizar.jsp?id=<%=item.getIdfranquia()%>">Atualizar</a></li>
                          <li class="mdl-menu__item"><a href="franquia_excluir_ok.jsp?id=<%=item.getIdfranquia()%>">Excluir franquia</a></li>
                    </ul>

                </div>
            </div>
        </div>
    </section>
</div>
<br>
<%  }
} else {%>
<div class="content-centro" >
    <div class="mdl-grid">

        <div class="mdl-cell mdl-cell--4-col">
            <div class="snippet-demo">





                <div class="demo-card-event mdl-card mdl-shadow--2dp">
                    <div class="mdl-card__title mdl-card--expand">
                        <h4>
                            <br>
                            <br>
                            Você ainda não cadastrou nenhuma franquia.

                        </h4>
                    </div>
                    <div class="mdl-card__actions mdl-card--border">
                        <a class="mdl-button mdl-button--colored mdl-js-button mdl-js-ripple-effect" href="franquia_cadastrar.jsp">
                            Cadastrar
                        </a>
                        <div class="mdl-layout-spacer"></div>

                    </div>
                </div>
            </div>

        </div>
    </div>
</div>

<%}%>
<%@include file="rodape_franquiador.jsp"%>


