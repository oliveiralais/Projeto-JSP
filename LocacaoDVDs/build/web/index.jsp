<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>

<html>
    <head>
      <title>Sistema para Locacao de DVDs</title>
      <meta charset="UTF-8">
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <link rel="stylesheet" href="${cp}/css/estilo.css"/>
    </head>

    <body class="fundo">

        <div class="caixa">

                <div>
                    <h1>Locação <br> DVDs</h1>
                </div>
                
                <div>
                    <p class="btTelaInicial">
                        <a class="linkOpcoes" href="${cp}/formularios/dvds/listagem.jsp">DVDS</a>
                    </p>
                    <p class="btTelaInicial">
                        <a class="linkOpcoes" href="${cp}/formularios/atores/listagem.jsp">Atores</a>
                    </p>
                    <p class="btTelaInicial">
                        <a class="linkOpcoes" href="${cp}/formularios/generos/listagem.jsp">Gêneros</a>
                    </p>
                    <p class="btTelaInicial">
                        <a class="linkOpcoes" href="${cp}/formularios/classificacoes/listagem.jsp">Classificações Etárias</a>
                    </p>
                </div>

          </div>

    </body>

</html>
