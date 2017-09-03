<%-- 
    Document   : franquia_atualizar_ok
    Created on : Apr 19, 2017, 4:13:32 PM
    Author     : paton
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="modelo.Categoria"%>
<%@page import="modelo.Franquia"%>
<%@page import="modelo.Franquiador"%>
<%@page import="DAO.CategoriaDAO"%>
<%@page import="DAO.FranquiaDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    if (request.getParameter("id") == null || request.getParameter("id").isEmpty()) {
        response.sendRedirect("franquia_listar.jsp");
        return;
    }
    String msg="";
    int capital = Integer.parseInt(request.getParameter("txtCapital"));
    String nome = request.getParameter("txtNome");
    String descricao = request.getParameter("txtDescricao");
    Double valorinicial = Double.parseDouble(request.getParameter("txtValorinicial"));
    String tempo = request.getParameter("txtTempo");
    String categoria = request.getParameter("selCategoria");
    String franquiador =request.getParameter("selFranquiador");
    Double  valortotal= capital * Integer.parseInt(tempo)+valorinicial;
    String id = request.getParameter("id");
    String foto =  request.getParameter("txtFoto");
        
        
        //Chamar a inclusão da DAO
        FranquiaDAO dao = new FranquiaDAO();
        
         CategoriaDAO cdao = new CategoriaDAO();
        
        Franquiador fran = new Franquiador();
        
        Franquia obj = new Franquia();
        
        Categoria cat;
        
        fran.setCnpj(franquiador);
        cat = cdao.buscarPorChavePrimaria(Integer.parseInt(categoria));
        obj.setIdfranquia(Integer.parseInt(id));
        obj.setValortotal(valortotal);
        obj.setTempolucro(Integer.parseInt(tempo));
        obj.setNome(nome);
        obj.setDescricao(descricao);
        obj.setValorinicial(valorinicial);
        obj.setFranquiador(fran);
        List <Categoria> lista = new ArrayList<>();
        lista.add(cat);
        obj.setCategoriaList(lista);
        obj.setCapital(capital);
        obj.setFoto(foto);
        try
        {
            dao.alterar(obj);
            msg = "Registro alterado com sucesso";
        }
        catch(Exception ex)
        {
            msg = "Erro ao alterar registro";
        }
        
    
    
%>
<%@include file="cabecalho_admin.jsp" %>
<section class="section--center mdl-grid mdl-grid--no-spacing mdl-shadow--2dp">
    <div class="mdl-card mdl-cell mdl-cell--12-col">
        <div class="mdl-card__supporting-text ">
            <h4>Franquiador - Cadastrar</h4>
            <p><%=msg%></p>
            <a href="franquia_listar.jsp"><i class="material-icons">list</i></a>
            
        </div>

    </div>

</section>

<%@include file="rodape.jsp"%>
