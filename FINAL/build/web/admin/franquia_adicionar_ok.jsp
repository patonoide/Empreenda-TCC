<%-- 
    Document   : franquiad_adicionar_ok
    Created on : Apr 19, 2017, 4:12:46 PM
    Author     : paton
--%>

<%@page import="DAO.CategoriaDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="modelo.Categoria"%>
<%@page import="modelo.Franquiador"%>
<%@page import="modelo.Franquia"%>
<%@page import="DAO.FranquiaDAO"%>
<%
    String msg="";
    int capital = Integer.parseInt(request.getParameter("txtCapital"));
    String nome = request.getParameter("txtNome");
    String descricao = request.getParameter("txtDescricao");
    Double valorinicial = Double.parseDouble(request.getParameter("txtValorinicial"));
    String tempo = request.getParameter("txtTempo");
    String categoria = request.getParameter("selCategoria");
    String franquiador =request.getParameter("selFranquiador");
    Double  valortotal= capital * Integer.parseInt(tempo)+valorinicial;
    
    
        
        
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
        dao.fecharEmf();
        
        
        
    
    
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
