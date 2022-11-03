<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>

<html>
  <head>
    <title>Novo Gênero</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="${cp}/css/estilo.css"/>
  </head>

  <body class="fundo">
      
      <div class="caixaFormMenor">
          
        <h1>Novo Gênero</h1>

        <form method="post" action="${cp}/processaGeneros">

          <input name="acao" type="hidden" value="inserir"/>

          <table class="tabelaForm">
            <tr>
              <td class="tdTabela">Descrição:</td>
              <td>
                <input name="descricao"
                       type="text"
                       size="20"
                       maxlength="45"
                       required/>
              </td>
            </tr>
            <tr>
              <td>
              </td>
              <td class="alinharDireita">
                <input type="submit" value="Salvar"/>
              </td>
            </tr>
          </table>
          
        </form>
        
        <p class="btTI"><a class="linkTI" href="${cp}/formularios/generos/listagem.jsp">Voltar</a></p>
        
      </div>

  </body>

</html>