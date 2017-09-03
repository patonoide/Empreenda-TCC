<%-- 
    Document   : empreendedor_cadastrar_ok
    Created on : Mar 27, 2017, 1:20:28 PM
    Author     : paton
--%>

<%@page import="criptografia.Criptografia"%>
<%@page import="java.util.ArrayList"%>
<%@page import="DAO.CategoriaDAO"%>
<%@page import="modelo.Empreendedor"%>
<%@page import="DAO.EmpreendedorDAO"%>
<%@page import="java.util.List"%>
<%@page import="modelo.Categoria"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    int x = 0;
    Criptografia c= new Criptografia();
    String msg = "";
    String cpf = request.getParameter("txtCpf");
    String nome = request.getParameter("txtNome");
    String contato = request.getParameter("txtContato");
    String senha = request.getParameter("txtSenha");
    String dinheiro = request.getParameter("txtDinheiro");
    String idade = request.getParameter("txtIdade");
    String categoria = request.getParameter("selCategoria");
    if (cpf == null || categoria.equals("Selecione") == true) {
        response.sendRedirect("empreendedor_cadastrar.jsp");
    } else {

        //Chamar a inclusão da DAO
        EmpreendedorDAO dao = new EmpreendedorDAO();

        Empreendedor obj = new Empreendedor();
        CategoriaDAO cdao = new CategoriaDAO();
        Categoria cat;

        List<Empreendedor> listae;
        listae = dao.listar();
        for (Empreendedor item : listae) {
            if (item.getCpf().equals(cpf) == true) {
                x++;
            }
        }

        if (x == 0) {
            cat = cdao.buscarPorChavePrimaria(Integer.parseInt(categoria));
            obj.setNome(nome);
            obj.setContato(contato);
            obj.setSenha(c.cripto(senha+c.cripto(c.cripto(senha))));
            obj.setCpf(cpf);
            obj.setDinheiro(Double.parseDouble(dinheiro));
            obj.setIdade(Integer.parseInt(idade));
            List<Categoria> lista = new ArrayList<>();
            lista.add(cat);
            obj.setCategoriaList(lista);

            try {
                dao.incluir(obj);
                msg = "Registro cadastrado com sucesso";
            } catch (Exception ex) {
                msg = "Erro ao cadastrar registro";
            }
        } else {
            msg = "Usuário já cadastrado";
        }
    }


%>
<%@include file="cabecalho.jsp" %>


<div class="mdl-card__supporting-text content-login nquebra">
    <h4>Empreendedor - Cadastrar</h4>
    <p><%=msg%></p>
    <a href="login_empreendedor.jsp"> <button type="submit" class="mdl-button mdl-js-button mdl-button--raised mdl-button--colored">
            Login
        </button></a>

</div>




<%@include file="rodape.jsp"%>
