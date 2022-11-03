<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="cp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>

<html>
  <head>
    <title>Alterar DVD</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="${cp}/css/estilo.css"/>
  </head>

  <body class="fundo">
      
      <div class="caixaForm">
          
        <h1>Alterar DVD</h1>
        
        <form method="post" action="${cp}/processaDVDs">

            <input name="acao" type="hidden" value="alterar"/>
            <input name="id" type="hidden" value="${requestScope.dvd.id}"/>

            <table class="tabelaForm">
              <tr>
                <td class="tdTabela">Título:</td>
                <td>
                  <input name="titulo"
                         type="text"
                         size="20"
                         maxlength="45"
                         value="${requestScope.dvd.titulo}"/>
                </td>
              </tr>
              <tr>
                <td class="tdTabela">Ano de Lançamento:</td>
                <td>
                  <input name="anoLancamento"
                         type="number"
                         size="20"
                         max="9999"
                         value="${requestScope.dvd.anoLancamento}"/>
                </td>
              </tr>
              <tr>
                <td class="tdTabela">Ator Principal:</td>
                <td>

                  <jsp:useBean 
                      id="servicos" 
                      scope="page" 
                      class="locacaodvds.servicos.AtorServices"/>

                  <select name="idAtorPrincipal" required>
                    <c:forEach items="${servicos.todos}" var="ator">
                      <c:choose>
                            <c:when test="${requestScope.dvd.atorPrincipal.id eq
                                            ator.id}">
                                    <option value="${ator.id}" selected>
                                        ${ator.nome} ${ator.sobrenome}
                                    </option>
                            </c:when>
                            <c:otherwise>
                                <option value="${ator.id}">
                                    ${ator.nome} ${ator.sobrenome}
                                </option>
                            </c:otherwise>
                        </c:choose>>
                    </c:forEach>
                  </select>

                </td>
              </tr>
              <tr>
                <td class="tdTabela">Ator Coadjuvante:</td>
                <td>

                  <jsp:useBean 
                      id="servicos2" 
                      scope="page" 
                      class="locacaodvds.servicos.AtorServices"/>

                  <select name="idAtorCoadjuvante" required>
                    <c:forEach items="${servicos2.todos}" var="ator">
                       <c:choose>
                            <c:when test="${requestScope.dvd.atorCoadjuvante.id eq
                                            ator.id}">
                                    <option value="${ator.id}" selected>
                                        ${ator.nome} ${ator.sobrenome}
                                    </option>
                            </c:when>
                            <c:otherwise>
                                <option value="${ator.id}">
                                    ${ator.nome} ${ator.sobrenome}
                                </option>
                            </c:otherwise>
                        </c:choose>
                    </c:forEach>
                  </select>

                </td>
              </tr>
              <tr>
                <td class="tdTabela">Data do Lançamento:</td>
                <td>
                    <fmt:formatDate
                                  pattern="yyyy-MM-dd"
                                  value="${requestScope.dvd.dataLancamento}"
                                  var="data" scope="page"/>
                  <input name="dataLancamento"
                         type="date"
                         size="8"
                         placeholder="dd/mm/yyyy"
                         value="${requestScope.dvd.dataLancamento}"/>
                </td>
              </tr>
              <tr>
                <td class="tdTabela">Duração (minutos):</td>
                <td>
                  <input name="duracao"
                         type="number"
                         size="20"
                         max="999"
                         value="${requestScope.dvd.duracao}"/>
                </td>
              </tr>
              <tr>
                <td class="tdTabela">Gênero:</td>
                <td>

                  <jsp:useBean 
                      id="servicos3" 
                      scope="page" 
                      class="locacaodvds.servicos.GeneroServices"/>

                  <select name="idGenero" required>
                    <c:forEach items="${servicos3.todos}" var="genero">
                        <c:choose>
                            <c:when test="${requestScope.dvd.genero.id eq
                                            genero.id}">
                                    <option value="${genero.id}" selected>
                                        ${genero.descricao}
                                    </option>
                            </c:when>
                            <c:otherwise>
                                <option value="${genero.id}">
                                    ${genero.descricao}
                                </option>
                            </c:otherwise>
                        </c:choose>

                    </c:forEach>
                  </select>
                </td>
              </tr>
              <tr>
                <td class="tdTabela">Classificação Etária:</td>
                <td>

                  <jsp:useBean 
                      id="servicos4" 
                      scope="page" 
                      class="locacaodvds.servicos.ClassificacaoServices"/>

                  <select name="idClassificacao" required>
                    <c:forEach items="${servicos4.todos}" var="classificacao">
                        <c:choose>
                            <c:when test="${requestScope.dvd.classificacao.id eq
                                            classificacao.id}">
                                    <option value="${classificacao.id}" selected>
                                        ${classificacao.descricao}
                                    </option>
                            </c:when>
                            <c:otherwise>
                                <option value="${classificacao.id}">
                                    ${classificacao.descricao}
                                </option>
                            </c:otherwise>
                        </c:choose>
                    </c:forEach>
                  </select>
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
        
        <p class="btTI"><a class="linkTI" href="${cp}/formularios/dvds/listagem.jsp">Voltar</a></p>
        
      </div>

    

  </body>

</html>
