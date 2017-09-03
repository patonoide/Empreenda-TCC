<%-- 
    Document   : franquiador_cadastrar_ok
    Created on : Mar 27, 2017, 1:20:53 PM
    Author     : paton
--%>

<%@page import="criptografia.Criptografia"%>
<%@page import="java.util.List"%>
<%@page import="modelo.Franquiador"%>
<%@page import="DAO.FranquiadorDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@include file="cabecalho.jsp" %>
<%
    int x = 0;
    Criptografia c = new Criptografia();
    String msg = "";
    String cnpj = request.getParameter("txtCnpj");
    String nome = request.getParameter("txtNome");
    String contato = request.getParameter("txtContato");
    String senha = request.getParameter("txtSenha");
    if (contato == null || senha == null || nome == null || cnpj == null) {
        response.sendRedirect("franquiador_cadastrar.jsp");
    } else {

        //Chamar a inclusão da DAO
        FranquiadorDAO dao = new FranquiadorDAO();

        Franquiador obj = new Franquiador();

        List<Franquiador> lista;
        lista = dao.listar();
        for (Franquiador item : lista) {
            if (item.getCnpj().equals(cnpj) == true) {
                x++;
            }
        }

        if (x == 0) {

            obj.setNome(nome);
            obj.setContato(contato);
            obj.setSenha(c.cripto(senha+c.cripto(c.cripto(senha))));
            obj.setCnpj(cnpj);
            
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

<div class="mdl-card__supporting-text content-login nquebra">
    <h4>Franquiador - Cadastrar</h4>
    <p><%=msg%></p>
    <a href="login_franquiador.jsp"> <button type="submit" class="mdl-button mdl-js-button mdl-button--raised mdl-button--colored">
            Login
        </button></a>

</div>




<%@include file="rodape.jsp"%>
