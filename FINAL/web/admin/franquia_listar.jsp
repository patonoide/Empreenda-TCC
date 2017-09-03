<%-- 
    Document   : franquia_listar
    Created on : Apr 19, 2017, 4:17:02 PM
    Author     : paton
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="modelo.Categoria"%>
<%@page import="DAO.CategoriaDAO"%>
<%@page import="DAO.FranquiaDAO"%>
<%@page import="DAO.FranquiadorDAO"%>
<%@page import="java.util.List"%>
<%@page import="modelo.Franquiador"%>
<%@page import="modelo.Franquia"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
   FranquiaDAO dao = new FranquiaDAO();
    List<Franquia> lista;
    lista = dao.listar();
    String desc = "";
    String nome ="";
 
    
   
   
%>
<%@include file="cabecalho_admin.jsp" %>

<div class=" nquebra">
    <a href="franquia_adicionar.jsp">
        <button class="mdl-button mdl-js-button mdl-button--fab mdl-js-ripple-effect mdl-button--colored ">

            <i class="material-icons" >add</i>
        </button>      
    </a>

    <table class="mdl-data-table mdl-js-data-table">
        <thead>
            <tr>
                <th>CNPJ do Franquiador</th>
               
                <th>Id Franquia</th>
                <th>Descrição</th>
                <th>Valor Total</th>
                <th>Valor Inicial</th>
                <th>Tempo até Lucro</th>
                <th>Nome</th>
                <th>Capital de Giro</th>
                <th>Categoria</th>
                <th>Ações</th>
            </tr>



        </thead>
        <tbody>
              <%
                            for (Franquia item: lista){ 
                         if(item.getDescricao().length()>=20){ desc=(item.getDescricao().substring(0, 20));}else {desc=item.getDescricao();}
                         if(item.getNome().length()>=20){ nome=(item.getNome().substring(0, 20));}else {nome=item.getNome();}

%>
            <tr>
                <td><%=item.getFranquiador().getCnpj()%></td>
             
                <td><%=item.getIdfranquia()%></td>
                
        
                <td><%=desc %> </td>
                <td>R$ <%=item.getValortotal()%></td>
                <td>R$ <%=item.getValorinicial()%></td>
                <td><%=item.getTempolucro()%> Meses</td>
                <td><%=nome%></td>
                <td>R$ <%=item.getCapital()%></td>
                <td><%=item.getCategoriaListArrumado()%></td>
                   
               
                <td> <div id="ttupd" class="icon material-icons">
                        <i class="material-icons"><a href="franquia_atualizar.jsp?id=<%=item.getIdfranquia()%>">update</a></i>
                    </div>
                    <div class="mdl-tooltip" for="ttupd">
                        Atualizar
                    </div>
                    <!-- 
                        Excluir 
                    -->
                     <div id="ttimg" class="icon material-icons">
                        <i class="material-icons"><a href="franquia_imagem.jsp?id=<%=item.getIdfranquia()%>">image</a></i>
                    </div>
                    <div class="mdl-tooltip" for="ttupd">
                        Imagem
                    </div>
                    
                    
                    <div id="ttdel" class="icon material-icons">
                        <i class="material-icons"><a href="franquia_excluir_ok.jsp?id=<%=item.getIdfranquia()%>">delete</a></i>
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