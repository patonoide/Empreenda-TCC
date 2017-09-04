<%-- 
    Document   : sugestao_ok
    Created on : 02/09/2017, 01:05:55
    Author     : Asus
--%>

<%@page import="javax.mail.MessagingException"%>
<%@page import="javax.mail.Transport"%>

<%@page import="javax.mail.Message"%>

<%@page import="javax.mail.internet.InternetAddress"%>
<%@page import="javax.mail.internet.MimeMessage"%>
<%@page import="javax.mail.Session"%>
<%@page import="modelo.Avalia"%>
<%@page import="DAO.AvaliaDAO"%>
<%
    if (session.getAttribute("empreendedor") != null) {%>
<%@include file="cabecalho_empreendedor.jsp"%>
<%} else if (session.getAttribute("franquiador") != null) {%>
<%@include file="cabecalho_franquiador.jsp"%>
<%} else {%>
<%@include file="cabecalho.jsp"%>
<%}%>
<%@page import="java.util.Properties"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    // Recipient's email ID needs to be mentioned.
    Avalia a = new Avalia();
    String email = request.getParameter("txtContato");
    String nome = request.getParameter("txtNome");
    String coment = request.getParameter("txtSugestao");
    a.setComentario(coment);
    a.setEmail(email);
    a.setNome(nome);
    AvaliaDAO dao = new AvaliaDAO();
    dao.incluir(a);
    String result = null;
    // Sender's email ID needs to be mentioned
    String from = "empreendabyporto@gmail.com";
    String to = "patonoideoriginal@gmail.com";
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
        message.setSubject("Empreenda: sugestão nova");

        // Send the actual HTML message, as big as you like
        message.setContent("<h3>Olá a pessoa " + a.getNome() + " Email: " + a.getEmail() + "  Falou: " + a.getComentario() + " </h3>", "text/html");

        Transport transport = mailSession.getTransport("smtps");
        transport.connect("smtp.gmail.com", 465, "empreendabyporto@gmail.com", "empreenda123");
        transport.sendMessage(message, message.getAllRecipients());
        transport.close();
        // Send message

        result = "E-mail enviado com sucesso. ";
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
            <a href="index.jsp"> 
                <button type="submit" class="mdl-button mdl-js-button mdl-button--raised mdl-button--colored">
                    Voltar 
                </button>
            </a>
        </div>
    </div>
</div>


<%
    if (session.getAttribute("empreendedor") != null) {%>
<%@include file="rodape_empreendedor.jsp"%>
<%} else if (session.getAttribute("franquiador") != null) {%>
<%@include file="rodape_franquiador.jsp"%>
<%} else {%>
<%@include file="rodape.jsp"%>
<%}%>