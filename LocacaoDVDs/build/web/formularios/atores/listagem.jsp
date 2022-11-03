<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="cp" value="${pageContext.request.contextPath}"/>
<c:set var="prefixo" value="processaAtores?acao=preparar"/>
<!DOCTYPE html>

<html>
  <head>
    <title>Atores Cadastrados</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="${cp}/css/estilo.css"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css"/>
  </head>

  <body class="fundo">
      
      <div class="caixaAtor">
          
        <h1>Atores Cadastrados</h1>

        <p class="btDvd">
          <a class="linkDVD" href="${cp}/formularios/atores/novo.jsp">
            Novo Ator
          </a>
        </p>

        <table class="tabelaListagem">
          
          <thead>
            <tr>
              <th>Id</th>
              <th>Nome</th>
              <th>Sobrenome</th>
              <th>Data de Estreia</th>
              <th>Alterar</th>
              <th>Excluir</th>
            </tr>
          </thead>
          
          <tbody>

            <jsp:useBean 
                id="servicos"
                scope="page"
                class="locacaodvds.servicos.AtorServices"/>

            <c:forEach items="${servicos.todos}" var="ator">
              <tr class="colDvd">
                <td>${ator.id}</td>
                <td>${ator.nome}</td>
                <td>${ator.sobrenome}</td>
                <td><fmt:formatDate 
                    pattern="dd/MM/yyyy"
                    value="${ator.dataEstreia}"/></td>
                <td>
                  <a class="linkListagem" href="${cp}/${prefixo}Alteracao&id=${ator.id}">
                    <i class="fa-solid fa-pen-to-square"></i>
                  </a>
                </td>
                <td>
                  <a class="linkListagem" href="${cp}/${prefixo}Exclusao&id=${ator.id}">
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
