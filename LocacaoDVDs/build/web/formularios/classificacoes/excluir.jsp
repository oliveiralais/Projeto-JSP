<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>

<html>
  <head>
    <title>Excluir Classificação</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="${cp}/css/estilo.css"/>
  </head>

  <body class="fundo">
      
      <div class="caixaFormMenor">
        
        <h1>Excluir Classificação</h1>

        <form method="post" action="${cp}/processaClassificacoes">

          <input name="acao" type="hidden" value="excluir"/>
          <input name="id" type="hidden" value="${requestScope.classificacao.id}"/>

          <table class="tabelaForm">
            <tr>
              <td class="tdTabelaExcluir2">Descrição:</td>
              <td class="tdTabelaExcluir">${requestScope.classificacao.descricao}</td>
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
            
        <p class="btTI"><a class="linkTI" href="${cp}/formularios/classificacoes/listagem.jsp">Voltar</a></p>
        
      </div>

  </body>

</html>
