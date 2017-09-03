<%-- 
    Document   : empreendedor_listar
    Created on : Apr 19, 2017, 4:17:13 PM
    Author     : paton
--%>

<%@page import="java.util.List"%>
<%@page import="modelo.Empreendedor"%>
<%@page import="DAO.EmpreendedorDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    EmpreendedorDAO dao = new EmpreendedorDAO();
    List<Empreendedor> lista;
    lista = dao.listar();


%>
<%@include file="cabecalho_admin.jsp" %>
<div class="content-listar nquebra">
    <a href="empreendedor_adicionar.jsp">
        <button class="mdl-button mdl-js-button mdl-button--fab mdl-js-ripple-effect mdl-button--colored ">

            <i class="material-icons" >add</i>
        </button>      
    </a>

    <table class="mdl-data-table mdl-js-data-table">
        <thead>
            <tr>
                <th>CPF</th>

                <th>Nome</th>
                <th>Idade</th>
                <th>Dinheiro</th>
                <th>Contato</th>
                <th>Senha</th>
                <th>Interesse</th>
                <th>Ações</th>
            </tr>



        </thead>
        <tbody>
            <%                  for (Empreendedor item : lista) {
            %>
            <tr>
                <td><%=item.getCpf()%></td>





                <td><%=item.getNome()%></td>
                <td><%=item.getIdade()%></td>
                <td><%=item.getDinheiro()%></td>
                <td><%=item.getContato()%></td>
                <td><%=item.getSenha().substring(20) %></td>
                <td><%=item.getCategoriaListArrumado()%></td>

                <td> <div id="ttupd" class="icon material-icons">
                        <i class="material-icons"><a href="empreendedor_atualizar.jsp?id=<%=item.getCpf()%>">update</a></i>
                    </div>
                    <div class="mdl-tooltip" for="ttupd">
                        Atualizar
                    </div>
                    <!-- 
                        Excluir 
                    -->
                    <div id="ttdel" class="icon material-icons">
                        <i class="material-icons"><a href="empreendedor_excluir_ok.jsp?id=<%=item.getCpf()%>">delete</a></i>
                    </div>
                    <div class="mdl-tooltip" for="ttdel">
                        Excluir
                    </div>     </th>

            </td>
            <%}%>
        </tbody>
    </table>   

</div>

<%@include file="rodape.jsp"%>