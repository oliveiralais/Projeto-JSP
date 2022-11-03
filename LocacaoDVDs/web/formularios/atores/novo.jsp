<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>

<html>
  <head>
    <title>Novo Ator</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="${cp}/css/estilo.css"/>
  </head>

  <body class="fundo">
      
      <div class="caixaFormMenor">
          
        <h1>Novo Ator</h1>

        <form method="post" action="${cp}/processaAtores">

          <input name="acao" type="hidden" value="inserir"/>

          <table class="tabelaForm">
            <tr>
              <td class="tdTabela">Nome:</td>
              <td>
                <input name="nome"
                       type="text"
                       size="20"
                       maxlength="45"
                       required/>
              </td>
            </tr>
            <tr>
              <td class="tdTabela">Sobrenome:</td>
              <td>
                <input name="sobrenome"
                       type="text"
                       size="20"
                       maxlength="45"
                       required/>
              </td>
            </tr>
            <tr>
              <td class="tdTabela">Data de Estreia:</td>
              <td>
                <input name="dataEstreia"
                       type="date"
                       size="8"
                       placeholder="dd/mm/yyyy"
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
        
        <p class="btTI"><a class="linkTI" href="${cp}/formularios/atores/listagem.jsp">Voltar</a></p>
        
      </div>

  </body>

</html>
