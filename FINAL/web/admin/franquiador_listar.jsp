<%-- 
    Document   : franquiador_listar
    Created on : Apr 13, 2017, 12:17:14 AM
    Author     : paton
--%>

<%@page import="modelo.Franquiador"%>
<%@page import="java.util.List"%>
<%@page import="DAO.FranquiadorDAO"%>
<%
    FranquiadorDAO dao = new FranquiadorDAO();
    List<Franquiador> lista;
    lista = dao.listar();

%>
<%@include file="cabecalho_admin.jsp" %>
<div class="content-listar nquebra">
    <a href="franquiador_adicionar.jsp">
        <button class="mdl-button mdl-js-button mdl-button--fab mdl-js-ripple-effect mdl-button--colored ">

            <i class="material-icons" >add</i>
        </button>      
    </a>

    <table class="mdl-data-table mdl-js-data-table">
        <thead>
            <tr>
                <th>CNPJ</th>
                <th>Nome</th>
                <th>Contato</th>
                <th>Senha</th>
                <th>Ações</th>
            </tr>



        </thead>
        <tbody>
            <%                 for (Franquiador item : lista) {


            %>
            <tr>
                <td><%=item.getCnpj()%></td>
                <td><%=item.getNome()%></td>
                <td><%=item.getContato()%></td>
                <td><%=item.getSenha() %></td>

                <td> <div id="ttupd" class="icon material-icons">
                        <i class="material-icons"><a href="franquiador_atualizar.jsp?id=<%=item.getCnpj()%>">update</a></i>
                    </div>
                    <div class="mdl-tooltip" for="ttupd">
                        Atualizar
                    </div>
                    <!-- 
                        Excluir 
                    -->
                    <div id="ttdel" class="icon material-icons">
                        <i class="material-icons"><a href="franquiador_excluir_ok.jsp?id=<%=item.getCnpj()%>">delete</a></i>
                    </div>
                    <div class="mdl-tooltip" for="ttdel">
                        Excluir
                    </div>    
                </td>

            </tr>
            <%}%>
        </tbody>
    </table>   

</div>

<%@include file="rodape.jsp"%>