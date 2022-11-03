<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>

<html>
  <head>
    <title>Excluir Gênero</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="${cp}/css/estilo.css"/>
  </head>

  <body class="fundo">
      
      <div class="caixaFormMenor">
          
        <h1>Excluir Gênero</h1>

        <form method="post" action="${cp}/processaGeneros">

          <input name="acao" type="hidden" value="excluir"/>
          <input name="id" type="hidden" value="${requestScope.genero.id}"/>

          <table class="tabelaForm">
            <tr>
              <td class="tdTabelaExcluir2">Descrição:</td>
              <td class="tdTabelaExcluir">${requestScope.genero.descricao}</td>
            </tr>
            <tr>
              <td>
              </td>
              <td class="alinharDireita">
                <input type="submit" value="Excluir"/>
              </td>
            </tr>
          </table>

        </form>
            
        <p class="btTI"><a class="linkTI" href="${cp}/formularios/generos/listagem.jsp">Voltar</a></p>
        
      </div>

  </body>

</html>
