<%-- 
    Document   : catergoria_atualizar
    Created on : Apr 7, 2017, 6:58:01 PM
    Author     : paton
--%>
<%@page import="DAO.CategoriaDAO"%>
<%@page import="modelo.Categoria"%>
<%

    if (request.getParameter("id") == null) {
        response.sendRedirect("categoria_listar.jsp");
    }

    String id = request.getParameter("id");
    int x = Integer.parseInt(id);

    CategoriaDAO DAO = new CategoriaDAO();
    //buscar o registro pela chave primária
    Categoria obj = DAO.buscarPorChavePrimaria(x);
    if (obj == null) {
        response.sendRedirect("categoria_listar.jsp");
        return;
    }


%>

<%@include file="cabecalho_admin.jsp" %> 
<div class="content-login">
    <form action="categoria_atualizar_ok.jsp" method="POST">
        <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
            <input class="mdl-textfield__input" type="text" readonly  value="<%=obj.getIdcategoria()%>" name="txtId" />
            <label class="mdl-textfield__label" for="txtId">ID Categoria</label>
        </div>

        <div class="mdl-cell--12-col"> 
            <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                <input class="mdl-textfield__input" type="text" required  value="<%=obj.getNome()%>" name="txtNome" />
                <label class="mdl-textfield__label" for="txtNome">Nome</label>
            </div>
        </div>
        <div class="mdl-cell--12-col"> 
            <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                <textarea class="mdl-textfield__input" rows= "5" required name="txtDescricao" ><%=obj.getDescricao()%></textarea>
                <label class="mdl-textfield__label" for="txtDescricao">Descricao</label>
            </div>
        </div>
        <button type="submit" class="mdl-button mdl-js-button mdl-button--raised mdl-button--colored">
            Atualizar
        </button>
    </form>
</div>
<%@include file="rodape.jsp"%>
