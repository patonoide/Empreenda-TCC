<html lang="pt" class="mdl-js">
    <head>
        <link rel="icon" type="image/png" href="mdl/fav.png">
        <meta charset="ansi">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="description" content="Empreenda, um site para empreendedores.">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0">
        <title>Empreenda</title>
        <meta name="mobile-web-app-capable" content="no">

        <!-- Page styles -->


        <link rel="stylesheet" href="mdl/getmdl-select.min.css">
        <link rel="stylesheet" href="mdl/fonte2.css">
        <link rel="stylesheet" href="mdl/fonte.css">
        <link rel="stylesheet" href="mdl/material.min.css">
        <link rel="stylesheet" href="styles.css">

        <link rel="stylesheet" href="mdl/upload.scss">
        <link rel="stylesheet" href="mdl/upload.css">


        <style>

            .demo-card-wide.mdl-card {
                width: auto;
                margin: auto;
                background: url('../assets/demos/image_card.jpg') center / cover;
                align-content:center;
            }


            .demo-card-wide > .mdl-card__menu {
                color: #fff;
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
            .demo-card-event.mdl-card {
                width: 256px;
                height: 256px;
                background: #53c153;
            }
            .demo-card-event > .mdl-card__actions {
                border-color: rgba(255, 255, 255, 0.2);
                box-sizing:border-box;
                align-items: center;
            }
            .demo-card-event > .mdl-card__title {
                align-items: flex-start;
            }
            .demo-card-event > .mdl-card__title > h4 {
                margin-top: 0;
            }

            .demo-card-event > .mdl-card__actions > .material-icons {
                padding-right: 10px;
            }
            .demo-card-event > .mdl-card__title,
            .demo-card-event > .mdl-card__actions,
            .demo-card-event > .mdl-card__actions > .mdl-button {
                color: #fff;
            }
            #view-source {
                position: fixed;
                display: block;
                right: 0;
                bottom: 0;
                margin-right: 40px;
                margin-bottom: 40px;
                z-index: 900;
            }
            .mdl-layout__content {
                display: block;
                display: -webkit-flex; display: flex; -webkit-flex-direction: column; flex-direction: column;

            }
            .content-login {
                width: 600px;
                margin: 0 auto;
            }
            .content-cadastrar {
                width: 700px;
                margin: 0 auto;
            }
            .content-perfil{
                width: 90%;
                margin: 0 auto;
                padding-top: 20px !important;
                padding-bottom:20px !important;
            }
        </style>
        <script src="mdl/jquery-2.1.4.min.js"></script>
    </head>
    <body >
        <div class="mdl-layout mdl-js-layout mdl-layout--fixed-header ">

            <header class="android-header mdl-layout__header mdl-layout__header--waterfall mdl-shadow--2dp">

                <div class="mdl-layout__header-row">
                    <a href="javascript:history.go(-1)"><button class="  mdl-button mdl-js-button mdl-button--fab mdl-button--colored">
                            <i class="material-icons">undo</i>
                        </button></a>
                    <span class=" p20 android-title mdl-layout-title">

                        <img class="android-logo-image" src="mdl/empreenda.png">
                    </span>
                    <!-- Add spacer, to align navigation to the right in desktop -->
                    <div class="android-header-spacer mdl-layout-spacer">    </div>

                    <!-- Navigation -->
                    <div class="android-navigation-container ">
                        <nav class="android-navigation mdl-navigation">

                            <a class="mdl-navigation__link mdl-typography--text-uppercase" href="login_empreendedor.jsp">Empreendedor</a>
                            <a class="mdl-navigation__link mdl-typography--text-uppercase" href="login_franquiador.jsp">Franquiador</a>
                            <a class="mdl-navigation__link mdl-typography--text-uppercase" href="informacoes.jsp">Menu</a>
                            <a class="mdl-navigation__link mdl-typography--text-uppercase" href="franquia_lista.jsp">Franquia</a>
                            <a class="mdl-navigation__link mdl-typography--text-uppercase" href="index.jsp">Index</a>
                            <a class="mdl-navigation__link mdl-typography--text-uppercase" href="sugestao.jsp">Sugestão</a>
                            <%int testelogin = 0;%>
                        </nav>
                    </div>
                    <span class=" p20 android-mobile-title mdl-layout-title">

                        <img class="android-logo-image" src="mdl/empreenda.png">
                    </span>

                </div>
            </header>

            <div class="android-drawer mdl-layout__drawer">
                <span class="mdl-layout-title">
                    <img class="android-logo-image" src="mdl/empreendad.jpg">
                </span>
                <nav class="mdl-navigation">
                    <a class="mdl-navigation__link " href="login_empreendedor.jsp">Empreendedor</a>
                    <a class="mdl-navigation__link " href="login_franquiador.jsp">Franquiador</a>
                    <a class="mdl-navigation__link " href="informacoes.jsp">Menu</a>
                    <a class="mdl-navigation__link " href="franquia_lista.jsp">Franquia</a>
                    <a class="mdl-navigation__link " href="index.jsp">Index</a>
                    <a class="mdl-navigation__link " href="sugestao.jsp">Sugestão</a>
                </nav>
            </div>

            <main class="mdl-layout__content">
