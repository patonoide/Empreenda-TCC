<%-- 
    Document   : empreendedor_meuperfil
    Created on : Mar 27, 2017, 1:39:48 PM
    Author     : paton
--%>

<%@page import="java.text.DecimalFormat"%>
<%@page import="modelo.Empreendedor"%>
<%@page import="DAO.EmpreendedorDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>


<script src="mdl/jquery-2.1.4.min.js"></script>
<%
    EmpreendedorDAO dao = new EmpreendedorDAO();
    DecimalFormat df = new DecimalFormat("###.#");
    String cpf = session.getAttribute("empreendedor").toString();
    Empreendedor obj = dao.buscarPorChavePrimariaString(cpf);

%>
<%@include file="cabecalho_empreendedor.jsp"%>

<div class="content-perfil">
   
    <div class="mdl-grid">
        <div class="mdl-cell--12-col">
            <section class="mdl-card mdl-shadow--6dp card-perfil-franquiador">

                <div class="mdl-card__supporting-text">
                    <h4>Seu Nome: <%=obj.getNome()%></h4>
                    <h4>CPF: <%=obj.getCpf()%></h4>
                    <h4>Contato: <%=obj.getContato()%></h4>
                    <h4>Idade: <%=obj.getIdade()%></h4>
                    <h4>Interesse: <%=obj.getCategoriaListArrumado()%></h4>
                    <h4>Sua quantidade de dinheiro para investir: R$ <%=df.format(obj.getDinheiro())%></h4>
                    <div class="mdl-card__menu">
                        Opções
                        <button class="mdl-button mdl-js-button mdl-js-ripple-effect mdl-button--icon " id="btn1">
                            <i class="material-icons">account_circle</i>
                        </button>
                        <ul class="mdl-menu mdl-js-menu mdl-menu--upper-right " for="btn1">
                            <li class="mdl-menu__item"><a href="empreendedor_atualizar.jsp?id=<%=obj.getCpf()%>">Atualizar Dados</a></li>
                            <li class="mdl-menu__item"><a href="empreendedor_excluir_ok.jsp?id=<%=obj.getCpf()%>">Desativar Conta</a></li>
                            <li class="mdl-menu__item"><a href="empreendedor_senha.jsp">Modificar Senha</a></li>
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

        <div class="mdl-cell mdl-cell--4-col"></div>
        <div class="mdl-cell mdl-cell--4-col">
            <div class="snippet-demo">





                <div class="demo-card-event mdl-card mdl-shadow--2dp">
                    <div class="mdl-card__title mdl-card--expand">
                        <h4>
                            <br>
                            <br>
                            Ver suas Franquias Recomendadas.

                        </h4>
                    </div>
                    <div class="mdl-card__actions mdl-card--border">
                        <a class="mdl-button mdl-button--colored mdl-js-button mdl-js-ripple-effect" href="franquia_lista_recomendado.jsp?=<%=obj.getCpf()%>">
                            Ver Lista
                        </a>
                        <div class="mdl-layout-spacer"></div>

                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<%@include file="rodape_empreendedor.jsp"%>

