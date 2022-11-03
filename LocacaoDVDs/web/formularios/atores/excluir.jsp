<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="cp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>

<html>
  <head>
    <title>Excluir Ator</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="${cp}/css/estilo.css"/>
  </head>

  <body class="fundo">
      
      <div class="caixaFormMenor">
          
        <h1>Excluir Ator</h1>

        <form method="post" action="${cp}/processaAtores">

          <input name="acao" type="hidden" value="excluir"/>
          <input name="id" type="hidden" value="${requestScope.ator.id}"/>

          <table class="tabelaForm">
            <tr>
              <td class="tdTabelaExcluir2">Nome:</td>
              <td class="tdTabelaExcluir">${requestScope.ator.nome}</td>
            </tr>
            <tr>
              <td class="tdTabelaExcluir2">Sobrenome:</td>
              <td class="tdTabelaExcluir">${requestScope.ator.sobrenome}</td>
            </tr>
            <tr>
              <td class="tdTabelaExcluir2">Data de Estreia:</td>
              <td class="tdTabelaExcluir">
                <fmt:formatDate 
                    pattern="dd/MM/yyyy"
                    value="${requestScope.ator.dataEstreia}"/>
              </td>
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
              
        <p class="btTI"><a class="linkTI" href="${cp}/formularios/atores/listagem.jsp">Voltar</a></p>
                  
      </div>
  </body>

</html>
