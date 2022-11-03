<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="cp" value="${pageContext.request.contextPath}"/>
<c:set var="prefixo" value="processaDVDs?acao=preparar"/>
<!DOCTYPE html>

<html>
  <head>
    <title>DVDs Cadastrados</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="${cp}/css/estilo.css"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css"/>
  </head>

  <body class="fundo">
      
      <div class="caixaDVD">
            
            <h1>DVDs Cadastrados</h1>

            <p class="btDvd">
                <a class="linkDVD" href="${cp}/formularios/dvds/novo.jsp">
                Novo DVD
              </a>
            </p>

            <table class="tabelaListagem">
              <thead>
                <tr>
                  <th>Id</th>
                  <th>Título</th>
                  <th>Ano de Lançamento</th>
                  <th>Ator Principal</th>
                  <th>Ator Coadjuvante</th>
                  <th>Data Lançamento</th>
                  <th>Duração (minutos)</th>
                  <th>Gênero</th>
                  <th>Classificação Etária</th>
                  <th>Alterar</th>
                  <th>Excluir</th>
                </tr>
              </thead>
              <tbody>

                <jsp:useBean 
                    id="servicos"
                    scope="page"
                    class="locacaodvds.servicos.DVDServices"/>

                <c:forEach items="${servicos.todos}" var="dvd">
                  <tr class="colDvd">
                    <td>${dvd.id}</td>
                    <td>${dvd.titulo}</td>
                    <td>${dvd.anoLancamento}</td>
                    <td>${dvd.atorPrincipal.nome} ${dvd.atorPrincipal.sobrenome}</td>
                    <td>${dvd.atorCoadjuvante.nome} ${dvd.atorCoadjuvante.sobrenome}</td>
                    <td><fmt:formatDate 
                        pattern="dd/MM/yyyy"
                        value="${dvd.dataLancamento}"/></td>
                    <td>${dvd.duracao}</td>
                    <td>${dvd.genero.descricao}</td>
                    <td>${dvd.classificacao.descricao}</td>
                    <td>
                        <a class="linkListagem" href="${cp}/${prefixo}Alteracao&id=${dvd.id}">
                        <i class="fa-solid fa-pen-to-square"></i>
                      </a>
                    </td>
                    <td>
                      <a class="linkListagem" href="${cp}/${prefixo}Exclusao&id=${dvd.id}">
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
