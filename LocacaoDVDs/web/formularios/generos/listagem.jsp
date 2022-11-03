<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cp" value="${pageContext.request.contextPath}"/>
<c:set var="prefixo" value="processaGeneros?acao=preparar"/>
<!DOCTYPE html>

<html>
  <head>
    <title>Gêneros Cadastrados</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="${cp}/css/estilo.css"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css"/>
  </head>

  <body class="fundo">
      
      <div class="caixaGenero">
          
        <h1>Gêneros Cadastrados</h1>

        <p class="btDvd">
          <a class="linkDVD" href="${cp}/formularios/generos/novo.jsp">
            Novo Gênero
          </a>
        </p>

        <table class="tabelaListagem">
          <thead>
            <tr>
              <th class="col">Id</th>
              <th>Descrição</th>
              <th class="col">Alterar</th>
              <th class="col">Excluir</th>
            </tr>
          </thead>
          <tbody>

            <jsp:useBean 
                id="servicos"
                scope="page"
                class="locacaodvds.servicos.GeneroServices"/>

            <c:forEach items="${servicos.todos}" var="genero">
              <tr>
                <td class="colDvd">${genero.id}</td>
                <td>${genero.descricao}</td>
                <td class="colDvd">
                  <a class="linkListagem" href="${cp}/${prefixo}Alteracao&id=${genero.id}">
                    <i class="fa-solid fa-pen-to-square"></i>
                  </a>
                    
                </td>
                <td class="colDvd">
                  <a class="linkListagem" href="${cp}/${prefixo}Exclusao&id=${genero.id}">
                    <i class="fa-solid fa-trash"></i>
                  </a>
                </td>
              </tr>
            </c:forEach>
          </tbody>

        </table>

        <p class="btTI"><a class="linkTI" href="${cp}/index.jsp">Tela Principal</a></p>
         
      </div>
      
  </body>

</html>
