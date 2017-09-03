<%-- 
    Document   : franquiador_senha_ok
    Created on : 26/07/2017, 23:32:46
    Author     : Asus
--%>

<%@page import="modelo.Franquiador"%>
<%@page import="DAO.FranquiadorDAO"%>
<%@page import="criptografia.Criptografia"%>
<%@page import="java.util.List"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@include file="cabecalho_franquiador.jsp" %>
<%
 
    Criptografia c = new Criptografia();
    String msg = "";
    
    String senhaatual = request.getParameter("txtSenhaatual");
    String senhanova = request.getParameter("txtSenhanova");
    

        //Chamar a inclusão da DAO
        FranquiadorDAO dao = new FranquiadorDAO();

        Franquiador obj = new Franquiador();
        obj = dao.buscarPorChavePrimariaString(session.getAttribute("franquiador").toString());
    if(c.cripto(senhaatual+c.cripto(c.cripto(senhaatual))).equals(obj.getSenha())==true){
         obj.setSenha(c.cripto(senhanova+c.cripto(c.cripto(senhanova))));
         obj.setContato(obj.getContato());
         obj.setCnpj(obj.getCnpj());
         obj.setNome(obj.getNome());
          try {
                dao.incluir(obj);
                msg = "Senha alterada com sucesso.";
            } catch (Exception ex) {
                msg = "Erro ao cadastrar registro.";
            }
    }else{
        msg = "Senha Atual incorreta.";
    }

       

          
           
          
            
           
       
    

%>

<div class="mdl-card__supporting-text content-login nquebra">
    <h4>Franquiador - Senha</h4>
    <p><%=msg%></p>
    <a href="franquiador.meuperfil.jsp"> <button type="submit" class="mdl-button mdl-js-button mdl-button--raised mdl-button--colored">
            Voltar
        </button></a>

</div>
    <%@include file="rodape_franquiador.jsp" %>
