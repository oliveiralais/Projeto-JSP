package locacaodvds.controladores;

import java.io.IOException;
import java.sql.Date;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import locacaodvds.dao.DvdDAO;
import locacaodvds.entidades.Ator;
import locacaodvds.entidades.Classificacao;
import locacaodvds.entidades.DVD;
import locacaodvds.entidades.Genero;

/**
 *
 * @author Lais
 */
@WebServlet(name = "DVDsServlet", urlPatterns = {"/processaDVDs"})
public class DVDsServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String acao = request.getParameter( "acao" );
        
        DvdDAO dao = null;
        RequestDispatcher disp = null;
        DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        
        try {

            dao = new DvdDAO();

            if ( acao.equals( "inserir" ) ) {
                
                String titulo = request.getParameter( "titulo" );
                int anoLancamento = Integer.parseInt(request.getParameter( "anoLancamento" ));
                int idAtorPrincipal = Integer.parseInt( 
                        request.getParameter( "atorPrincipal_id" ) );
                int idAtorCoadjuvante = Integer.parseInt( 
                        request.getParameter( "atorCoadjuvante_id" ) );
                String dataLancamento = request.getParameter( "dataLancamento" );
                int duracao = Integer.parseInt(request.getParameter( "duracao" ));
                int idGenero = Integer.parseInt( 
                        request.getParameter( "genero_id" ) );
                int idClassificacao = Integer.parseInt( 
                        request.getParameter( "classificacaoEtaria_id" ) );

                Ator aP = new Ator();
                aP.setId( idAtorPrincipal );

                Ator aC = new Ator();
                aC.setId( idAtorCoadjuvante );

                Genero g = new Genero();
                g.setId(idGenero);

                Classificacao c = new Classificacao();
                c.setId(idClassificacao);

                DVD d = new DVD();
                d.setTitulo(titulo);
                d.setAnoLancamento(anoLancamento);
                d.setAtorPrincipal(aP);
                d.setAtorCoadjuvante(aC);
                d.setDataLancamento(Date.valueOf( LocalDate.parse( dataLancamento, dtf ) ));
                d.setDuracao(duracao);
                d.setGenero(g);
                d.setClassificacaoEtaria(c);

                dao.salvar( d );

                disp = request.getRequestDispatcher("/formularios/dvds/listagem.jsp" );
                

            } else if ( acao.equals( "alterar" ) ) {
                
                
                int id = Integer.parseInt(request.getParameter( "id" ));
                String titulo = request.getParameter( "titulo" );
                int anoLancamento = Integer.parseInt(request.getParameter( "anoLancamento" ));
                int idAtorPrincipal = Integer.parseInt( 
                        request.getParameter( "idAtorPrincipal" ) );
                int idAtorCoadjuvante = Integer.parseInt( 
                        request.getParameter( "idAtorCoadjuvante" ) );
                String dataLancamento = request.getParameter( "dataLancamento" );
                int duracao = Integer.parseInt(request.getParameter( "duracao" ));
                int idGenero = Integer.parseInt( 
                        request.getParameter( "idGenero" ) );
                int idClassificacao = Integer.parseInt( 
                        request.getParameter( "idClassificacao" ) );

                Ator aP = new Ator();
                aP.setId( idAtorPrincipal );

                Ator aC = new Ator();
                aC.setId( idAtorCoadjuvante );

                Genero g = new Genero();
                g.setId(idGenero);

                Classificacao c = new Classificacao();
                c.setId(idClassificacao);

                DVD d = new DVD();
                d.setId(id);
                d.setTitulo(titulo);
                d.setAnoLancamento(anoLancamento);
                d.setAtorPrincipal(aP);
                d.setAtorCoadjuvante(aC);
                d.setDataLancamento(Date.valueOf( LocalDate.parse( dataLancamento, dtf ) ));
                d.setDuracao(duracao);
                d.setGenero(g);
                d.setClassificacaoEtaria(c);

                dao.atualizar( d );

                disp = request.getRequestDispatcher("/formularios/dvds/listagem.jsp" );
                
            } else if ( acao.equals( "excluir" ) ) {

                int id = Integer.parseInt(request.getParameter( "id" ));

                DVD d = new DVD();
                d.setId( id );

                dao.excluir( d );

                disp = request.getRequestDispatcher(
                        "/formularios/dvds/listagem.jsp" );

            } else {
                
                int id = Integer.parseInt(request.getParameter( "id" ));
                DVD d = dao.obterPorId( id );
                request.setAttribute( "dvd", d );
                
                if ( acao.equals( "prepararAlteracao" ) ) {
                    disp = request.getRequestDispatcher( 
                            "/formularios/dvds/alterar.jsp" );
                } else if ( acao.equals( "prepararExclusao" ) ) {
                    disp = request.getRequestDispatcher( 
                            "/formularios/dvds/excluir.jsp" );
                }
                
            }

        } catch ( SQLException exc ) {
            exc.printStackTrace();
        } finally {
            if ( dao != null ) {
                try {
                    dao.fecharConexao();
                } catch ( SQLException exc ) {
                    exc.printStackTrace();
                }
            }
        }

        if ( disp != null ) {
            disp.forward( request, response );
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "DVDsServlet";
    }// </editor-fold>

}
