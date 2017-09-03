

<%@page import="DAO.FranquiadorDAO"%>
<%@page import="modelo.Franquiador"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    FranquiadorDAO dao = new FranquiadorDAO();

    String cnpj = session.getAttribute("franquiador").toString();
    Franquiador obj = dao.buscarPorChavePrimariaString(cnpj);

%>
<%@include file="cabecalho_franquiador.jsp"%>
<script src="mdl/material.min.js"></script>
<script src="mdl/jquery-2.1.4.min.js"></script>
<div class="content-perfil">
    <div class="mdl-grid">
        <div class="mdl-cell--12-col">
            <section class="mdl-card mdl-shadow--6dp card-perfil-franquiador">

                <div class="mdl-card__supporting-text">
                    <h4>Seu Nome: <%=obj.getNome()%></h4>
                    <h4>Contato: <%=obj.getContato()%></h4>
                    <h4>CNPJ: <%=obj.getCnpj()%></h4>
                    <div class="mdl-card__menu">
                        Opções
                        <button class="mdl-button mdl-js-button mdl-js-ripple-effect mdl-button--icon " id="btn1">
                            <i class="material-icons">account_circle</i>
                        </button>
                        <ul class="mdl-menu mdl-js-menu mdl-menu--upper-right " for="btn1">
                            <li class="mdl-menu__item"><a href="franquiador_atualizar.jsp?id=<%=obj.getCnpj()%>">Atualizar</a></li>
                            <li class="mdl-menu__item"><a href="franquiador_excluir_ok.jsp?id=<%=obj.getCnpj()%>">Desativar Conta</a></li>
                            <li class="mdl-menu__item"><a href="franquiador_senha.jsp">Modificar Senha</a></li>
                        </ul>
                    </div>

                </div>



            </section>

        </div>             
    </div>
</div>

<br>
<div class="content-cadastrar">
    <div class="mdl-grid">
        <div class="mdl-cell mdl-cell--4-col">
            <div class="snippet-demo">





                <div class="demo-card-event mdl-card mdl-shadow--2dp">
                    <div class="mdl-card__title mdl-card--expand">
                        <h4>
                            <br>
                            <br>
                            Cadastrar uma Franquia Nova

                        </h4>
                    </div>
                    <div class="mdl-card__actions mdl-card--border">
                        <a class="mdl-button mdl-button--colored mdl-js-button mdl-js-ripple-effect" href="franquia_cadastrar.jsp?cnpj=<%=obj.getCnpj()%>">
                            Cadastrar
                        </a>
                        <div class="mdl-layout-spacer"></div>

                    </div>
                </div>
            </div>
        </div>
        <div class="mdl-cell mdl-cell--4-col"></div>
        <div class="mdl-cell mdl-cell--4-col">
            <div class="snippet-demo">





                <div class="demo-card-event mdl-card mdl-shadow--2dp">
                    <div class="mdl-card__title mdl-card--expand">
                        <h4>
                            <br>
                            <br>
                            Ver suas Franquias

                        </h4>
                    </div>
                    <div class="mdl-card__actions mdl-card--border">
                        <a class="mdl-button mdl-button--colored mdl-js-button mdl-js-ripple-effect" href="franquiador_minhas_franquias.jsp?cnpj=<%=obj.getCnpj()%>">
                            Ver Lista
                        </a>
                        <div class="mdl-layout-spacer"></div>

                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<%@include file="rodape_franquiador.jsp"%>
