<%-- 
    Document   : franquia_lista_recomendado
    Created on : Apr 12, 2017, 2:40:56 PM
    Author     : paton
--%>

<%@include file="cabecalho_empreendedor.jsp"%>


<!-- Image card -->
<style>
    .demo-card-image.mdl-card {
        width: 256px;
        height: 256px;
        background: url('../assets/demos/image_card.jpg') center / cover;
    }
    .demo-card-image > .mdl-card__actions {
        height: 52px;
        padding: 16px;
        background: rgba(0, 0, 0, 0.2);
    }
    .demo-card-image__filename {
        color: #fff;
        font-size: 14px;
        font-weight: 500;
    }
   
</style>
<div class="content-super-cadastrar" >
    <div class="mdl-grid">

        <div class="mdl-cell mdl-cell--3-col">
            <div class="snippet-demo">





                <div class="demo-card-event mdl-card mdl-shadow--2dp">
                    <div class="mdl-card__title mdl-card--expand">
                        <h4>
                            <br>
                            
                            <%if (Integer.parseInt(application.getAttribute("quantidadec").toString()) > 1) {%> <%=application.getAttribute("quantidadec")%> Recomendações por Interesse <%} else { %>
                            <%if (Integer.parseInt(application.getAttribute("quantidadec").toString()) == 1) {%> <%=application.getAttribute("quantidadec")%> Recomendação por Interesse <%} else {%>
                            Nenhuma Recomendação por Interesse
                            <% }
                                }%>
                        </h4>
                    </div>
                    <div class="mdl-card__actions mdl-card--border">
                        <a class="mdl-button mdl-button--colored mdl-js-button mdl-js-ripple-effect" href="franquia_filtrocategoria.jsp">
                            Ver
                        </a>
                        <div class="mdl-layout-spacer"></div>

                    </div>
                </div>
            </div>

        </div>
        <div class="mdl-cell mdl-cell--1-col"></div>

        <div class="mdl-cell mdl-cell--3-col"> <div class="snippet-demo">





                <div class="demo-card-event mdl-card mdl-shadow--2dp">
                    <div class="mdl-card__title mdl-card--expand">
                        <h4>
                            <br>
                            

                            <%if (Integer.parseInt(application.getAttribute("quantidadev").toString()) > 1) {%> <%=application.getAttribute("quantidadev")%> Recomendações por Valor <%} else {%>
                            <%if (Integer.parseInt(application.getAttribute("quantidadev").toString()) == 1) {%> <%=application.getAttribute("quantidadev")%> Recomendação por Valor<%} else {%>
                            Nenhuma Recomendação por Valor
                            <%}
                                }%>

                        </h4>
                    </div>
                    <div class="mdl-card__actions mdl-card--border">
                        <a class="mdl-button mdl-button--colored mdl-js-button mdl-js-ripple-effect" href="franquia_filtrovalor.jsp">
                            Ver
                        </a>
                        <div class="mdl-layout-spacer"></div>

                    </div>
                </div>
            </div>

        </div>
        <div class="mdl-cell mdl-cell--1-col"></div>
        <div class="mdl-cell mdl-cell--4-col">
            <div class="snippet-demo">





                <div class="demo-card-event mdl-card mdl-shadow--2dp">
                    <div class="mdl-card__title mdl-card--expand">
                        <h4>

                            <%if (Integer.parseInt(application.getAttribute("quantidadecv").toString()) > 1) {%> 
                            <br>
                            <br><%=application.getAttribute("quantidadecv")%>  
                            Recomendações por Interesse e Valor <%} else { %>
                            <%if (Integer.parseInt(application.getAttribute("quantidadecv").toString()) == 1) {%> 
                            <br>
                            <br><%=application.getAttribute("quantidadecv")%> 
                            Recomendação por Interesse e Valor <%} else {%><br>
                            Nenhuma Recomendação por Interesse e Valor
                            <%}
                                }%>
                        </h4>
                    </div>
                    <div class="mdl-card__actions mdl-card--border">
                        <a class="mdl-button mdl-button--colored mdl-js-button mdl-js-ripple-effect" href="franquia_filtrocategoria_valor.jsp">
                            Ver
                        </a>
                        <div class="mdl-layout-spacer"></div>

                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<%@include file="rodape_empreendedor.jsp"%>