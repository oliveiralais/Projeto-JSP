<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>

<html>
  <head>
    <title>Novo DVD</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="${cp}/css/estilo.css"/>
  </head>

  <body class="fundo">
    
    <div class="caixaForm">
        
        <h1>Novo DVD</h1>
        
        <form method="post" action="${cp}/processaDVDs">

            <input name="acao" type="hidden" value="inserir"/>

            <table class="tabelaForm">
              <tr>
                <td class="tdTabela">Título:</td>
                <td>
                  <input name="titulo"
                         type="text"
                         size="20"
                         maxlength="45"
                         required/>
                </td>
              </tr>
              <tr>
                <td class="tdTabela">Ano de Lançamento:</td>
                <td>
                  <input name="anoLancamento"
                         type="number"
                         size="4"
                         max="9999"
                         required/>
                </td>
              </tr>
              <tr>
                <td class="tdTabela">Ator Principal:</td>
                <td>

                  <jsp:useBean 
                      id="servicos" 
                      scope="page" 
                      class="locacaodvds.servicos.AtorServices"/>

                  <select name="atorPrincipal_id" >
                    <c:forEach items="${servicos.todos}" var="ator">
                      <option value="${ator.id}">
                        ${ator.nome} ${ator.sobrenome}
                      </option>
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

                  <select name="atorCoadjuvante_id" >
                    <c:forEach items="${servicos2.todos}" var="ator">
                      <option value="${ator.id}">
                        ${ator.nome} ${ator.sobrenome}
                      </option>
                    </c:forEach>
                  </select>

                </td>
              </tr>
              <tr>
                <td class="tdTabela">Data do Lançamento:</td>
                <td>
                  <input name="dataLancamento"
                         type="date"
                         size="8"
                         placeholder="dd/mm/yyyy"
                         required/>
                </td>
              </tr>
              <tr>
                <td class="tdTabela">Duração (minutos):</td>
                <td>
                  <input name="duracao"
                         type="number"
                         size="20"
                         maxlength="999"
                         required/>
                </td>
              </tr>
              <tr>
                <td class="tdTabela">Gênero:</td>
                <td>

                  <jsp:useBean 
                      id="servicos3" 
                      scope="page" 
                      class="locacaodvds.servicos.GeneroServices"/>

                  <select name="genero_id" required>
                    <c:forEach items="${servicos3.todos}" var="genero">
                      <option value="${genero.id}">
                        ${genero.descricao}
                      </option>
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

                  <select name="classificacaoEtaria_id" required>
                    <c:forEach items="${servicos4.todos}" var="classificacao">
                      <option value="${classificacao.id}">
                        ${classificacao.descricao}
                      </option>
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
