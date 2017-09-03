<%-- 
    Document   : franquia_atualziar_ok
    Created on : Mar 27, 2017, 1:39:24 PM
    Author     : paton
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="DAO.FranquiaDAO"%>
<%@page import="DAO.CategoriaDAO"%>
<%@page import="modelo.Franquiador"%>
<%@page import="java.util.List"%>
<%@page import="modelo.Franquia"%>
<%@page import="modelo.Categoria"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    if (request.getParameter("cnpj") == null || request.getParameter("cnpj").isEmpty()) {
        response.sendRedirect("franquiador_minhas_franquias.jsp");
        return;
    }
    String msg="";
    int capital = Integer.parseInt(request.getParameter("txtCapital"));
    String nome = request.getParameter("txtNome");
    String descricao = request.getParameter("txtDescricao");
    Double valorinicial = Double.parseDouble(request.getParameter("txtValorinicial"));
    String tempo = request.getParameter("txtTempo");
    String categoria = request.getParameter("selCategoria");
    String franquiador =request.getParameter("cnpj");
    Double  valortotal= capital * Integer.parseInt(tempo)+valorinicial;
    String id = request.getParameter("id");
     String cnpj = session.getAttribute("franquiador").toString();
        String foto = request.getParameter("txtFoto");
        
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
        if( Long.parseLong(obj.getFranquiador().getCnpj()) != Long.parseLong(cnpj)){
        response.sendRedirect("franquiador_meuperfil.jsp");
    
    
    }
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
<%@include file="cabecalho_franquiador.jsp" %>
<div class="mdl-card__supporting-text content-login nquebra">
            <h4>Franquia - Atualizada</h4>
            <p><%=msg%></p>
            <a href="franquiador_minhas_franquias.jsp?cnpj=<%=session.getAttribute("franquiador").toString()%>"> <button type="submit" class="mdl-button mdl-js-button mdl-button--raised mdl-button--colored">
            Voltar
        </button></a>
            
        </div>

<%@include file="rodape_franquiador.jsp"%>
