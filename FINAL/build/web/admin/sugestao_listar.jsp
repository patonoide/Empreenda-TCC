<%-- 
    Document   : sugestao_listar
    Created on : 02/09/2017, 11:30:45
    Author     : Asus
--%>

<%@page import="modelo.Avalia"%>
<%@page import="java.util.List"%>
<%@page import="DAO.AvaliaDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    AvaliaDAO dao = new AvaliaDAO();
    List<Avalia> lista;
    lista = dao.listar();

%>
<%@include file="cabecalho_admin.jsp" %>
<div class="content-login nquebra">
    

    <table class="mdl-data-table mdl-js-data-table">
        <thead>
            <tr>
                <th>ID</th>
                <th>Nome</th>
                <th>Comentário</th>
                <th>Email</th>
                <th>Ações</th>

            </tr>



        </thead>
        <tbody>
            <%                 for (Avalia item : lista) {


            %>
            <tr>
                <td><%=item.getIdavalia()%></td>
                <td><%=item.getNome()%></td>
                <td><%=item.getComentario()%></td>
                <td><%=item.getEmail()%></td>
                <td> 
                    <!-- 
                        Excluir 
                    -->
                    <div id="ttdel" class="icon material-icons">
                        <i class="material-icons"><a href="sugestao_excluir_ok.jsp?id=<%=item.getIdavalia()%>">delete</a></i>
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
