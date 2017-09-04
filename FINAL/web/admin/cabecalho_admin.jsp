<%
//testar se ele está logado
    if (session.getAttribute("usuarioAdmin") == null) {
        response.sendRedirect("login.jsp");
    }

%>

<!doctype html>

<html lang="pt-br">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="description" content="A front-end template that helps you build fast, modern mobile web apps.">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Gerenciamento de Sistemas</title>

        <meta name="mobile-web-app-capable" content="yes">

        <link rel="stylesheet" href="../mdl/fonte2.css">
        <link rel="stylesheet" href="../mdl/fonte.css">
        <link rel="stylesheet" href="../mdl/material.min.css">
        <link rel="stylesheet" href="../styles.css">
        <link rel="stylesheet" href="../mdl/upload.scss">
        <link rel="stylesheet" href="../mdl/upload.css">
        <style>
            .footer-30{
                
                left:0px;
                bottom:0px;
                height:30px;
                width:95%;
                background:#999;
                
            }
           
        </style>

        <script src="../mdl/jquery-2.1.4.min.js"></script>
        <script src="../mdl/material.min.js"></script>


    </head>

    <body class="mdl-demo mdl-color--grey-100 mdl-color-text--grey-700 mdl-base">
        <div class="mdl-layout mdl-js-layout mdl-layout--fixed-header">
            <header class="mdl-layout__header mdl-layout__header--scroll mdl-color--primary">
                <div class="mdl-layout__header-row">
                </div>
                <div class="mdl-layout--large-screen-only mdl-layout__header-row">
                    <h3>Área Administrativa</h3>

                </div>
                <div class="mdl-layout--large-screen-only mdl-layout__header-row">
                    <p>Admin - <a href="login.jsp?sair=OK">Sair</a></p>
                </div>

                <div class=" mdl-js-ripple-effect mdl-color--primary-dark">

                    <a href="categoria_listar.jsp" class="mdl-layout__tab">Categoria</a>
                    <a href="franquiador_listar.jsp" class="mdl-layout__tab">Franquiador</a>
                    <a href="franquia_listar.jsp" class="mdl-layout__tab">Franquia</a>
                    <a href="empreendedor_listar.jsp" class="mdl-layout__tab">Empreendedor</a>
                     <a href="sugestao_listar.jsp" class="mdl-layout__tab">Sugestão</a>
                </div>
            </header>
            <main class="mdl-layout__content">
                <div class="mdl-layout__tab-panel is-active" id="overview">
