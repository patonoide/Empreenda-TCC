
<%    

 if(request.getParameter("sair")!=null)
 {
   
     session.setAttribute("usuarioAdmin", null);
 }
    

String msg = ""; 
if(request.getParameter("txtLogin")!=null && 
        request.getParameter("txtSenha")!=null)
{
    msg = "Tentou fazer o login";
    String login = request.getParameter("txtLogin").toString();
    String senha = request.getParameter("txtSenha").toString();
    if(login.equals("adm") && senha.equals("123") )
    {
        
        session.setAttribute("usuarioAdmin", login);
        
        response.sendRedirect("categoria_listar.jsp");
        
    }
    else
    {
        msg = "Otário";
    }
}
    
    

%>




<!doctype html>
 <script src="../mdl/jquery-2.1.4.min.js"></script>
        <script src="../mdl/material.min.js"></script>
<body class="mdl-demo mdl-color--grey-100 mdl-color-text--grey-700 mdl-base">
    <div class="mdl-layout mdl-js-layout mdl-layout--fixed-header">
      <header class="mdl-layout__header mdl-layout__header--scroll mdl-color--primary">
        <div class="mdl-layout__header-row">
        </div>
        <div class="mdl-layout--large-screen-only mdl-layout__header-row">
          <h3>Área Administrativa</h3>
        </div>
        <div class="mdl-layout--large-screen-only mdl-layout__header-row">
        </div>
        
      </header>
      <main class="mdl-layout__content">
        <div class="mdl-layout__tab-panel is-active" id="overview">
<link rel="stylesheet" href="../mdl/fonte2.css">
        <link rel="stylesheet" href="../mdl/fonte.css">
        <link rel="stylesheet" href="../mdl/material.min.css">
        <link rel="stylesheet" href="../styles.css">
        


<section class="section--center mdl-grid mdl-grid--no-spacing mdl-shadow--2dp">
    <div class="mdl-card mdl-cell mdl-cell--12-col">
        <div class="mdl-card__supporting-text content-login">
            <h4>Gerenciamento do Sistema</h4>
            <div>
                <%=msg%>
            </div>
            <form action="login.jsp" method="post">
                <div class="content-login"> 
                    <div class="mdl-cell--12-col">
                        <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                            <input class="mdl-textfield__input" type="text" required  id="txtLogin" name="txtLogin" />
                            <label class="mdl-textfield__label" for="txtNome">Login</label>
                        </div>
                    </div>    
                    <div class="mdl-cell--12-col">
                    
                        <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                            <input class="mdl-textfield__input" type="password" required  id="txtSenha" name="txtSenha" />
                            <label class="mdl-textfield__label" for="txtSenha">Senha</label>
                        </div>
                    </div>
                    <div>

                       <button type="submit" class="mdl-button mdl-js-button mdl-button--raised mdl-button--colored">
                            Entrar
                        </button>
                        
                    </div>

                </div>
            </form>
            <br>
            <br>
            <a href="../index.jsp"<button type="submit" class="mdl-button mdl-js-button mdl-button--raised mdl-button--colored">
                            Index
                </button></a>
        </div>

    </div>

</section>

