<%-- 
    Document   : franquia_cadastrar_ok
    Created on : Mar 27, 2017, 1:39:04 PM
    Author     : paton
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="modelo.Categoria"%>
<%@page import="DAO.CategoriaDAO"%>
<%@page import="modelo.Franquia"%>
<%@page import="modelo.Franquiador"%>
<%@page import="DAO.CategoriaDAO"%>
<%@page import="DAO.FranquiaDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    String msg="";
    int capital = Integer.parseInt(request.getParameter("txtCapital"));
    String nome = request.getParameter("txtNome");
    String descricao = request.getParameter("txtDescricao");
    Double valorinicial = Double.parseDouble(request.getParameter("txtValorinicial"));
    String tempo = request.getParameter("txtTempo");
    String categoria = request.getParameter("selCategoria");
    String franquiador =request.getParameter("txtFranquiador");
    Double  valortotal= capital * Integer.parseInt(tempo)+valorinicial;
    
    
        if(categoria.equals("Selecione")==true){
            response.sendRedirect("franquia_cadastrar.jsp");
        }else{
        
        //Chamar a inclusão da DAO
        FranquiaDAO dao = new FranquiaDAO();
        
         CategoriaDAO cdao = new CategoriaDAO();
        
        Franquiador fran = new Franquiador();
        
        Franquia obj = new Franquia();
        
        Categoria cat;
        
        fran.setCnpj(franquiador);
        cat = cdao.buscarPorChavePrimaria(Integer.parseInt(categoria));
        obj.setCapital(capital);
        obj.setValortotal(valortotal);
        obj.setTempolucro(Integer.parseInt(tempo));
        obj.setNome(nome);
        obj.setDescricao(descricao);
        obj.setValorinicial(valorinicial);
        obj.setFranquiador(fran);
   
        List <Categoria> lista = new ArrayList<>();
        
        lista.add(cat);
        obj.setCategoriaList(lista);
       
        
       
        
        try
        {
            dao.incluir(obj);
            msg = "Registro cadastrado com sucesso";
        }
        catch(Exception ex)
        {
            msg = "Erro ao cadastrar registro";
        }
      
        }
        
        
    
    
%>
<%@include file="cabecalho_franquiador.jsp" %>
 <div class="mdl-card__supporting-text content-login nquebra">
            <h4>Franquia - Cadastrado</h4>
            <p><%=msg%></p>
            <a href="franquiador_meuperfil.jsp"> <button type="submit" class="mdl-button mdl-js-button mdl-button--raised mdl-button--colored">
            Voltar
        </button></a>
            
        </div>

<%@include file="rodape_franquiador.jsp" %>