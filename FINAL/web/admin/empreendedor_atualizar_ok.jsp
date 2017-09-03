<%-- 
    Document   : empreendedor_atualizar_ok
    Created on : Apr 19, 2017, 4:14:33 PM
    Author     : paton
--%>

<%@page import="criptografia.Criptografia"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="modelo.Categoria"%>
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
        Empreendedor o =dao.buscarPorChavePrimariaString(cpf);
        CategoriaDAO cdao = new CategoriaDAO();
        Categoria cat;
        cat = cdao.buscarPorChavePrimaria(Integer.parseInt(categoria));
        obj.setNome(nome);
        obj.setContato(contato);
        if(senha.equals(o.getSenha())==false){
            obj.setSenha(c.cripto(senha+c.cripto(c.cripto(senha))));
        }else{
            obj.setSenha(o.getSenha());
        }
       
        obj.setCpf(cpf);
        obj.setDinheiro(Double.parseDouble(dinheiro));
        obj.setIdade(Integer.parseInt(idade));
         List <Categoria> lista = new ArrayList<>();
        lista.add(cat);
        obj.setCategoriaList(lista);
        try
        {
            dao.alterar(obj);
            msg = "Registro atualizado com sucesso";
        }
        catch(Exception ex)
        {
            msg = "Erro ao cadastrar registro";
        }
        
    }
    
%>

<%@include file="cabecalho_admin.jsp" %> 
<div class="content-login">
    <div class="mdl-grid">
        <div class="mdl-cell mdl-cell--4-col">
            <%=msg%>
        </div>
        
        
        <div class="mdl-cell mdl-cell--4-col">
            <a href="empreendedor_listar.jsp"> 
                <button type="submit" class="mdl-button mdl-js-button mdl-button--raised mdl-button--colored">
                    Voltar 
                </button>
            </a>
        </div>
    </div>
</div>

<%@include file="rodape.jsp"%>
