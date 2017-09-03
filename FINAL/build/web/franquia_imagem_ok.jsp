<%-- 
    Document   : franquia_imagem_ok
    Created on : Jun 8, 2017, 3:52:51 PM
    Author     : paton
--%>
<%@page import="modelo.Franquia"%>
<%@page import="DAO.FranquiaDAO"%>
<%@include file="cabecalho_franquiador.jsp"%>
<%@page import="util.Upload"%>
<%@ page import = "java.io.*,java.util.*, javax.servlet.*" %>
<%@ page import = "javax.servlet.http.*" %>
<%@ page import = "org.apache.commons.fileupload.*" %>
<%@ page import = "org.apache.commons.fileupload.disk.*" %>
<%@ page import = "org.apache.commons.fileupload.servlet.*" %>
<%@ page import = "org.apache.commons.io.output.*" %>

<%
   File file ;
   int maxFileSize = 5000 * 1024;
   int maxMemSize = 5000 * 1024;
   ServletContext context = pageContext.getServletContext();
   String filePath = context.getInitParameter("file-upload");
   String msg ="deu ruim";
    String cnpj = session.getAttribute("franquiador").toString();
   // Verify the content type
   FranquiaDAO dao = new FranquiaDAO();
   Franquia obj =dao.buscarPorChavePrimaria(Integer.parseInt(application.getAttribute("franquia").toString()));
   String contentType = request.getContentType();
   if( obj.getFranquiador().getCnpj().equals(cnpj)==false){
        response.sendRedirect("franquiador_meuperfil.jsp");
    
    
    }
   if ((contentType.indexOf("multipart/form-data") >= 0)) {
      DiskFileItemFactory factory = new DiskFileItemFactory();
      // maximum size that will be stored in memory
      factory.setSizeThreshold(maxMemSize);
      
      // Location to save data that is larger than maxMemSize.
      factory.setRepository(new File("c:\\temp"));

      // Create a new file upload handler
      ServletFileUpload upload = new ServletFileUpload(factory);
      
      // maximum file size to be uploaded.
      upload.setSizeMax( maxFileSize );
      
      try { 
         // Parse the request to get file items.
         List fileItems = upload.parseRequest(request);

         // Process the uploaded file items
         Iterator i = fileItems.iterator();

         
         
         while ( i.hasNext () ) {
            FileItem fi = (FileItem)i.next();
            if ( !fi.isFormField () ) {
               // Get the uploaded file parameters
               String fieldName = fi.getFieldName();
               String fileName = fi.getName();
               boolean isInMemory = fi.isInMemory();
               long sizeInBytes = fi.getSize();
            
               obj.setFoto(fi.getName());
               dao.alterar(obj);
               if( fileName.lastIndexOf("\\") >= 0 ) {
                  file = new File( filePath + 
                  fileName.substring( fileName.lastIndexOf("\\"))) ;
               } else {
                  file = new File( filePath + 
                  fileName.substring(fileName.lastIndexOf("\\")+1)) ;
               }
               fi.write( file ) ;
                msg =("Uploaded Filename: " + filePath + 
               fileName + "<br>");
            }
         }
         out.println("</body>");
         out.println("</html>");
      } catch(Exception ex) {
         System.out.println(ex);
         msg="Nenhuma imagem foi selecionada";
         obj.setFoto("anvil.png");
         dao.alterar(obj);
         
      }
   } else {
      out.println("<html>");
      out.println("<head>");
      out.println("<title>Servlet upload</title>");  
      out.println("</head>");
      out.println("<body>");
      out.println("<p>No file uploaded</p>"); 
      out.println("</body>");
      out.println("</html>");
   }
%>
 <div class="mdl-card__supporting-text content-login nquebra">
            <h4>Imagem - Atualizado</h4>
            <p><%=msg%></p>
            <a href="franquiador_meuperfil.jsp"> <button type="submit" class="mdl-button mdl-js-button mdl-button--raised mdl-button--colored">
            Voltar
        </button></a>
            
        </div>

<%@include file="rodape_franquiador.jsp"%>