<%-- 
    Document   : franquiador_atualizar_ok
    Created on : Apr 13, 2017, 2:10:00 PM
    Author     : paton
--%>

<%@page import="criptografia.Criptografia"%>
<%@page import="modelo.Franquiador"%>
<%@page import="DAO.FranquiadorDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    if (request.getParameter("cnpj") == null || request.getParameter("cnpj").isEmpty()) {
        response.sendRedirect("franquiador_listar.jsp");
        return;
    }
    Criptografia c = new Criptografia();
    String msg="";
    String cnpj = request.getParameter("cnpj");
    String nome = request.getParameter("txtNome");
    String contato = request.getParameter("txtContato");
    String senha = request.getParameter("txtSenha");
    if(contato == null  || senha == null || nome== null || cnpj == null)
    {
        response.sendRedirect("franquiador_listar.jsp");
    }
    else
    {
    
        
        
        //Chamar a inclusão da DAO
        FranquiadorDAO dao = new FranquiadorDAO();
        
        Franquiador obj = new Franquiador();
        Franquiador o =dao.buscarPorChavePrimariaString(cnpj);
        obj.setNome(nome);
        obj.setContato(contato);
        if(senha.equals(o.getSenha())==false){
            obj.setSenha(c.cripto(senha+c.cripto(c.cripto(senha))));
        }else{
            obj.setSenha(o.getSenha());
        }
        obj.setCnpj(cnpj);
        try
        {
            dao.alterar(obj);
            msg = "Registro atualizado com sucesso";
        }
        catch(Exception ex)
        {
            msg = "Erro ao atualizar registro";
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
            <a href="franquiador_listar.jsp"> 
                <button type="submit" class="mdl-button mdl-js-button mdl-button--raised mdl-button--colored">
                    Voltar 
                </button>
            </a>
        </div>
    </div>
</div>
        <%@include file="rodape.jsp"%>
        