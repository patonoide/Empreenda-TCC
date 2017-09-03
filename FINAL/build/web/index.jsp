<%-- 
    Document   : index
    Created on : May 8, 2017, 7:13:22 PM
    Author     : paton
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>
<%@include file="cabecalho.jsp"%>


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
<div class="content-cadastrar" >
    <div class="mdl-grid">

        <div class="mdl-cell mdl-cell--4-col">
            <div class="snippet-demo">





                <div class="demo-card-event mdl-card mdl-shadow--2dp">
                    <div class="mdl-card__title mdl-card--expand">
                        <h4>
                            <br>
                            <br>
                            Entrar no Site

                        </h4>
                    </div>
                    <div class="mdl-card__actions mdl-card--border">
                        <a class="mdl-button mdl-button--colored mdl-js-button mdl-js-ripple-effect" href="informacoes.jsp">
                            Site
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
                            Área Administrativa

                        </h4>
                    </div>
                    <div class="mdl-card__actions mdl-card--border">
                        <a class="mdl-button mdl-button--colored mdl-js-button mdl-js-ripple-effect" href="admin/login.jsp">
                            Administração
                        </a>
                        <div class="mdl-layout-spacer"></div>

                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<%@include file="rodape.jsp"%>