<%-- 
    Document   : empreendedor_adicionar_ok
    Created on : Apr 19, 2017, 4:14:07 PM
    Author     : paton
--%>

<%@page import="criptografia.Criptografia"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="modelo.Categoria"%>
<%@page import="DAO.CategoriaDAO"%>
<%@page import="modelo.Empreendedor"%>
<%@page import="DAO.EmpreendedorDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    String msg="";
    Criptografia c = new Criptografia();
    String cpf = request.getParameter("txtCpf");
    String nome = request.getParameter("txtNome");
    String contato = request.getParameter("txtContato");
    String senha = request.getParameter("txtSenha");
    String dinheiro = request.getParameter("txtDinheiro");
    String idade = request.getParameter("txtIdade");
    String categoria = request.getParameter("selCategoria");
    if(cpf == null)
    {
        response.sendRedirect("empreendedor_listar.jsp");
    }
    else
    {
    
        
        
        //Chamar a inclusão da DAO
        EmpreendedorDAO dao = new EmpreendedorDAO();
        
        Empreendedor obj = new Empreendedor();
        CategoriaDAO cdao = new CategoriaDAO();
        Categoria cat;
        cat = cdao.buscarPorChavePrimaria(Integer.parseInt(categoria));
        obj.setNome(nome);
        obj.setContato(contato);
        obj.setSenha(c.cripto(senha+c.cripto(c.cripto(senha))));
        obj.setCpf(cpf);
        obj.setDinheiro(Double.parseDouble(dinheiro));
        obj.setIdade(Integer.parseInt(idade));
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
<%@include file="cabecalho_admin.jsp" %>
<section class="section--center mdl-grid mdl-grid--no-spacing mdl-shadow--2dp">
    <div class="mdl-card mdl-cell mdl-cell--12-col">
        <div class="mdl-card__supporting-text ">
            <h4>Empreendedor - Cadastradado</h4>
            <p><%=msg%></p>
            <a href="empreendedor_listar.jsp"><i class="material-icons">list</i></a>
            
        </div>

    </div>

</section>

<%@include file="rodape.jsp"%>
