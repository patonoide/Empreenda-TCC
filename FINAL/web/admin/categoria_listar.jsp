<%-- 
    Document   : categoria_listar
    Created on : Apr 7, 2017, 6:57:17 PM
    Author     : paton
--%>



<%@page import="DAO.CategoriaDAO"%>
<%@page import="java.util.List"%>
<%@page import="modelo.Categoria"%>

<%
    CategoriaDAO dao = new CategoriaDAO();
    List<Categoria> lista;
    lista = dao.listar();

%>
<%@include file="cabecalho_admin.jsp" %>
<div class="content-login nquebra">
    <a href="categoria_adicionar.jsp">
        <button class="mdl-button mdl-js-button mdl-button--fab mdl-js-ripple-effect mdl-button--colored ">

            <i class="material-icons" >add</i>
        </button>      
    </a>

    <table class="mdl-data-table mdl-js-data-table">
        <thead>
            <tr>
                <th>ID</th>
                <th>Nome</th>
                <th>Descrição</th>
                <th>Ações</th>

            </tr>



        </thead>
        <tbody>
            <%                 for (Categoria item : lista) {


            %>
            <tr>
                <td><%=item.getIdcategoria()%></td>
                <td><%=item.getNome()%></td>
                <td><%=item.getDescricao()%></td>

                <td> <div id="ttupd" class="icon material-icons">
                        <i class="material-icons"><a href="categoria_atualizar.jsp?id=<%=item.getIdcategoria()%>">update</a></i>
                    </div>
                    <div class="mdl-tooltip" for="ttupd">
                        Atualizar
                    </div>
                    <!-- 
                        Excluir 
                    -->
                    <div id="ttdel" class="icon material-icons">
                        <i class="material-icons"><a href="categoria_excluir_ok.jsp?id=<%=item.getIdcategoria()%>">delete</a></i>
                    </div>
                    <div class="mdl-tooltip" for="ttdel">
                        Excluir
                    </div>     </td>

            </tr>
            <%}%>






        </tbody>
    </table>

</div>
<%@include file="rodape.jsp"%>
