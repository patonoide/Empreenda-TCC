<%-- 
    Document   : rodape_franquiador
    Created on : May 12, 2017, 3:06:07 PM
    Author     : paton
--%>

</main>

<footer class="  android-footer mdl-mega-footer mdl-shadow--2dp-top " >

    <div class="mdl-mega-footer--top-section ">
        <div class="mdl-mega-footer--left-section">

        </div>
        <div class="mdl-mega-footer--right-section">
            <a class="mdl-typography--font-light" href="#top">
                Topo da Página
                <i class="material-icons">expand_less</i>
            </a>
        </div>
    </div>

    <div class="mdl-mega-footer--middle-section">
        <p class="mdl-typography--font-light">Gabriel Porto Productions</p>

    </div>

    <div class="mdl-mega-footer--bottom-section">

        <a class="android-link mdl-typography--font-light" href="franquiador_meuperfil.jsp">Meu Perfil</a>
        <a class="android-link mdl-typography--font-light" href="franquia_lista.jsp">Ver Todas Franquias</a>
        <a class="android-link mdl-typography--font-light" href="franquiador_minhas_franquias.jsp?cnpj=<%=session.getAttribute("franquiador").toString()%>">Ver Minhas Franquias</a>
        <a class="android-link mdl-typography--font-light" href="login_franquiador.jsp?sair=ok">Sair</a>
    </div>

</footer>
  <script src="mdl/material.min.js"></script>
<script src="mdl/jquery-2.1.4.min.js"></script>
<script src="mdl/getmdl-select.min.js"></script>
<script src="mdl/upload.js"></script>
</body>
</html>

