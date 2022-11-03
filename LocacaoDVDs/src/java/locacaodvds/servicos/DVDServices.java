package locacaodvds.servicos;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import locacaodvds.dao.DvdDAO;
import locacaodvds.entidades.DVD;

/**
 *
 * @author Lais
 */
public class DVDServices {
    
    public List<DVD> getTodos() {

        List<DVD> lista = new ArrayList<>();
        DvdDAO dao = null;

        try {
            dao = new DvdDAO();
            lista = dao.listarTodos();
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

        return lista;

    }
}
