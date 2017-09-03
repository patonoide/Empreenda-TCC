<%-- 
    Document   : franquia_imagem
    Created on : Jun 8, 2017, 3:52:34 PM
    Author     : paton
--%>
<%@page import="modelo.Franquia"%>
<%@page import="DAO.FranquiaDAO"%>
<%@page import="DAO.FranquiadorDAO"%>
<%@include file="cabecalho_admin.jsp"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
   
    FranquiadorDAO fDAO = new FranquiadorDAO();
    
    
if (request.getParameter("id") == null) {
        response.sendRedirect("franquiador_minhas_franquias.jsp");
    }

    String id = request.getParameter("id");
    
   
    FranquiaDAO DAO = new FranquiaDAO();
    //buscar o registro pela chave primária
    Franquia obj = DAO.buscarPorChavePrimaria(Integer.parseInt(id));
    application.setAttribute("franquia", obj.getIdfranquia());
    
    if (obj == null) {
        response.sendRedirect("franquia_listar.jsp");
        return;
    }
%>
<div class="content-login nquebra" >
    <form action="franquia_imagem_ok.jsp" method="post" enctype="multipart/form-data" >
        <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
            <input class="mdl-textfield__input"  readonly  value="<%=obj.getFranquiador().getCnpj()%>" name="cnpj" />
            <label class="mdl-textfield__label" for="cnpj">CNPJ</label>
        </div>
            <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
            <input class="mdl-textfield__input"  readonly   value="<%=obj.getIdfranquia()%>" name="Idfranquia" />
            <label class="mdl-textfield__label" for="Idfranquia">IDFranquia</label>
        </div>
<div class="mdl-textfield mdl-js-textfield mdl-textfield--file">
    <input class="mdl-textfield__input" placeholder="Escolha uma Imagem JPEG 256 x 256" type="text"  id="uploadFile" readonly/>
    <div class="mdl-button mdl-button--primary mdl-button--icon mdl-button--file">
      <i class="material-icons">attach_file</i><input type="file" name="file-upload" id="uploadBtn">
    </div>
  </div>
        <br>
        <button type="submit" class="mdl-button mdl-js-button mdl-button--raised mdl-button--colored">
            Adicionar
        </button>
    </form>
</div>
            
            <script src="../mdl/upload.js"></script>
<%@include file="rodape.jsp"%>