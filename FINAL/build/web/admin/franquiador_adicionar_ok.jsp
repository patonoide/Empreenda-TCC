<%-- 
    Document   : franquiador_adicionar_ok
    Created on : Apr 13, 2017, 1:37:58 PM
    Author     : paton
--%>

<%@page import="criptografia.Criptografia"%>
<%@page import="modelo.Franquiador"%>
<%@page import="DAO.FranquiadorDAO"%>
<%
    String msg="";
    Criptografia c = new Criptografia();
    String cnpj = request.getParameter("txtCnpj");
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
        obj.setNome(nome);
        obj.setContato(contato);
        obj.setSenha(c.cripto(senha+c.cripto(c.cripto(senha))));
        obj.setCnpj(cnpj);
       
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
            <h4>Franquiador - Cadastradado</h4>
            <p><%=msg%></p>
            <a href="franquiador_listar.jsp"><i class="material-icons">list</i></a>
            
        </div>

    </div>

</section>

<%@include file="rodape.jsp"%>