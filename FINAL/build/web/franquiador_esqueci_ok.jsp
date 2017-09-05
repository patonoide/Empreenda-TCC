<%-- 
    Document   : franquiador_esqueci
    Created on : Jun 10, 2017, 12:21:09 AM
    Author     : paton
--%>

<%@page import="modelo.Franquiador"%>
<%@page import="DAO.FranquiadorDAO"%>
<%@page import="modelo.Empreendedor"%>
<%@page import="javax.mail.MessagingException"%>
<%@page import="javax.mail.Transport"%>
<%@page import="javax.mail.Message"%>
<%@page import="javax.mail.internet.InternetAddress"%>
<%@page import="javax.mail.internet.MimeMessage"%>
<%@page import="javax.mail.Session"%>
<%@page import="java.util.Properties"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@include file="cabecalho.jsp"%>
<%
    String cnpj = request.getParameter("cnpj");
    FranquiadorDAO dao =  new FranquiadorDAO();
    Franquiador obj = dao.buscarPorChavePrimariaString(cnpj);
    String to = obj.getContato();
    String result;
    // Sender's email ID needs to be mentioned
    String from = "empreendabyporto@gmail.com";

    // Assuming you are sending email from localhost
    String host = "smtp.gmail.com";

    // Get system properties object
    Properties properties = System.getProperties();

    // Setup mail server
    properties.put("mail.smtp.user", "empreendabyporto@gmail.com");
    properties.put("mail.smtp.host", "smtp.gmail.com");
    properties.put("mail.smtp.port", "587");
    properties.put("mail.smtp.starttls.enable", "true");
    properties.put("mail.smtp.debug", "true");
    properties.put("mail.smtp.auth", "true");
    properties.put("mail.smtp.socketFactory.port", "587");
    properties.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
    properties.put("mail.smtp.socketFactory.fallback", "true");

    properties.setProperty("mail.smtp.host", host);

    // Get the default Session object.
    Session mailSession = Session.getDefaultInstance(properties);

    try {
        // Create a default MimeMessage object.
        MimeMessage message = new MimeMessage(mailSession);

        // Set From: header field of the header.
        message.setFrom(new InternetAddress(from));

        // Set To: header field of the header.
        message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));

        // Set Subject: header field
        message.setSubject("Empreenda: esqueceu a senha.");

        // Send the actual HTML message, as big as you like
        message.setContent("<h1>Olá "+obj.getNome()+" aqui esta a senha que voce esqueceu:"+obj.getSenha()+" </h1>", "text/html");

        Transport transport = mailSession.getTransport("smtps");
        transport.connect("smtp.gmail.com", 465, "empreendabyporto@gmail.com", "");
        transport.sendMessage(message, message.getAllRecipients());
        transport.close();
        // Send message

        result = "E-mail mandado com sucesso aguarde sua senha. ";
    } catch (MessagingException mex) {
        mex.printStackTrace();
        result = "Erro. ";
    }
    %>
<div class="content-login nquebra">
    <div class="mdl-grid">
        
        <div class="mdl-cell mdl-cell--4-col">
            <%=result%>
        </div>
        
        
        <div class="mdl-cell mdl-cell--4-col">
            <a href="login_franquiador.jsp"> 
                <button type="submit" class="mdl-button mdl-js-button mdl-button--raised mdl-button--colored">
                    Voltar 
                </button>
            </a>
        </div>
    </div>
</div>

<%@include file="rodape.jsp"%>