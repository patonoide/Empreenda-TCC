<%-- 
    Document   : franquiador_atualizar
    Created on : Mar 27, 2017, 1:37:54 PM
    Author     : paton
--%>

<%@page import="modelo.Franquiador"%>
<%@page import="DAO.FranquiadorDAO"%>
<%@include file="cabecalho_franquiador.jsp"%>
<%    if (request.getParameter("id") == null) {
        response.sendRedirect("franquiador_listar.jsp");
    }

    String id = request.getParameter("id");
    

    FranquiadorDAO DAO = new FranquiadorDAO();
    //buscar o registro pela chave primária
    Franquiador obj = DAO.buscarPorChavePrimariaString(id);
    if (obj == null) {
        response.sendRedirect("franquiador_listar.jsp");
        return;
    }


%>
<div class="content-login nquebra">
    <form action="franquiador_atualizar_ok.jsp" method="post">
        <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
            <input class="mdl-textfield__input"  readonly  value="<%=obj.getCnpj()%>" name="cnpj" />
            <label class="mdl-textfield__label" for="cnpj">CNPJ</label>
        </div>
            
        <div class="mdl-cell--12-col hidden"> 
            <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                <input class="mdl-textfield__input" type="text" required  value="<%=obj.getSenha()%>" name="txtSenha" />
                <label class="mdl-textfield__label" for="txtSenha"><%=obj.getSenha()%></label>
            </div>
        </div>
        <div class="mdl-cell--12-col"> 
            <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                <input class="mdl-textfield__input" type="text" required  value="<%=obj.getNome()%>" name="txtNome" />
                <label class="mdl-textfield__label" for="txtNome">Nome</label>
            </div>
        </div>
         <div class="mdl-cell--12-col"> 
            <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                <input class="mdl-textfield__input"  type="email"  required name="txtContato" value="<%=obj.getContato()%> ">
                <label class="mdl-textfield__label" for="txtContato">E-mail</label>
            </div>
        </div>
       
        <button type="submit" class="mdl-button mdl-js-button mdl-button--raised mdl-button--colored">
            Atualizar
        </button>
    </form>
</div>
                
<%@include file="rodape.jsp"%>
