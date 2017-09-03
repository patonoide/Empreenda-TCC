<%-- 
    Document   : rodape_empreendedor
    Created on : May 12, 2017, 3:06:20 PM
    Author     : paton
--%>

<%@page import="javax.xml.bind.Marshaller.Listener"%>
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
<%
application.getAttribute("recomendado");
%>
    <div class="mdl-mega-footer--bottom-section">

        <a class="android-link mdl-typography--font-light" href="empreendedor_meuperfil.jsp">Meu Perfil</a>
        <a class="android-link mdl-typography--font-light" href="franquia_lista.jsp">Ver Todas Franquias</a>
        <a class="android-link mdl-typography--font-light" href="franquia_lista_recomendado.jsp">Ver Franquias  <span class="mdl-badge" data-badge="<%=application.getAttribute("recomendado") %>">Recomendadas</span></a>
        <a class="android-link mdl-typography--font-light" href="login_empreendedor.jsp?sair=ok">Sair</a>

    </div>

</footer>

  <script src="mdl/material.min.js"></script>

<script src="mdl/getmdl-select.min.js"></script>
<script src="mdl/upload.js"></script>
</body>
</html>


