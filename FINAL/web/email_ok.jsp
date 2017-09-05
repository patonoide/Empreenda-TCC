<%-- 
    Document   : email_ok
    Created on : Jun 3, 2017, 9:55:37 PM
    Author     : paton
--%>

<%@page import="java.text.DecimalFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%@include file="cabecalho_empreendedor.jsp"%>
<script src="mdl/material.min.js"></script>
<script src="mdl/jquery-2.1.4.min.js"></script>
<%@ page import = "java.io.*,java.util.*,javax.mail.*"%>
<%@ page import = "javax.mail.internet.*,javax.activation.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>

<%    String franquia = request.getParameter("franquia");
    EmpreendedorDAO dao = new EmpreendedorDAO();
    Empreendedor emp = dao.buscarPorChavePrimariaString(cpff);
    FranquiaDAO daofemail = new FranquiaDAO();
    Franquia fran = daofemail.buscarPorChavePrimaria(Integer.parseInt(franquia));
    String result;
    DecimalFormat df = new DecimalFormat("###.#");
    // Recipient's email ID needs to be mentioned.
    String to = fran.getFranquiador().getContato();

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
        message.setSubject("Empreenda: existe um empreendedor interessado em sua franquia");

        // Send the actual HTML message, as big as you like
        message.setContent("<h1>Olá o empreendedor " + emp.getNome() + " CPF: " + emp.getCpf() + "  E-mail: " + emp.getContato() + " com a seguinte quantidade para investir: R$ "+ df.format(emp.getDinheiro())+" tem interesse em sua franquia " + fran.getNome() + " de acordo com o site "
                + " Empreenda. </h1>", "text/html");

        Transport transport = mailSession.getTransport("smtps");
        transport.connect("smtp.gmail.com", 465, "empreendabyporto@gmail.com", "");
        transport.sendMessage(message, message.getAllRecipients());
        transport.close();
        // Send message

        result = "E-mail mandado com sucesso aguarde o retorno do Franquiador. ";
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
            <a href="empreendedor_meuperfil.jsp"> 
                <button type="submit" class="mdl-button mdl-js-button mdl-button--raised mdl-button--colored">
                    Voltar 
                </button>
            </a>
        </div>
    </div>
</div>

<%@include file="rodape_empreendedor.jsp"%>