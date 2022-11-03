package locacaodvds.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import locacaodvds.entidades.Ator;
import locacaodvds.entidades.Classificacao;
import locacaodvds.entidades.DVD;
import locacaodvds.entidades.Genero;

/**
 *
 * @author Lais
 */
public class DvdDAO extends DAO<DVD>{

    public DvdDAO() throws SQLException {
    }
    
    @Override
    public void salvar(DVD obj) throws SQLException {
        
        PreparedStatement stmt = getConnection().prepareStatement(
                "INSERT INTO " + 
                "dvd(" + 
                "    titulo, " + 
                "    anoLancamento, " + 
                "    atorPrincipal_id, " + 
                "    atorCoadjuvante_id, " + 
                "    dataLancamento, " + 
                "    duracao, " + 
                "    genero_id, " + 
                "    classificacaoEtaria_id) " +  
                "VALUES( ?, ?, ?, ?, ?, ?, ?, ? );" );

        stmt.setString( 1, obj.getTitulo() );
        stmt.setInt( 2, obj.getAnoLancamento());
        stmt.setInt( 3, obj.getAtorPrincipal().getId());
        stmt.setInt( 4, obj.getAtorCoadjuvante().getId());
        stmt.setDate( 5, obj.getDataLancamento() );
        stmt.setInt( 6, obj.getDuracao());
        stmt.setInt( 7, obj.getGenero().getId());
        stmt.setInt( 8, obj.getClassificacao().getId());
        
        stmt.executeUpdate();
        stmt.close();
    }

    @Override
    public void atualizar(DVD obj) throws SQLException {
        
        PreparedStatement stmt = getConnection().prepareStatement(
                "UPDATE dvd " + 
                "SET" + 
                "    titulo = ?, " + 
                "    anoLancamento = ?," + 
                "    atorPrincipal_id = ?, " + 
                "    atorCoadjuvante_id = ?, " + 
                "    dataLancamento = ?, " + 
                "    duracao = ?, " + 
                "    genero_id = ?, " + 
                "    classificacaoEtaria_id = ? " + 
                "WHERE" + 
                "    id = ?;" );

        stmt.setString( 1, obj.getTitulo() );
        stmt.setInt( 2, obj.getAnoLancamento());
        stmt.setInt( 3, obj.getAtorPrincipal().getId());
        stmt.setInt( 4, obj.getAtorCoadjuvante().getId());
        stmt.setDate( 5, obj.getDataLancamento() );
        stmt.setInt( 6, obj.getDuracao());
        stmt.setInt( 7, obj.getGenero().getId());
        stmt.setInt( 8, obj.getClassificacao().getId());
        stmt.setInt( 9, obj.getId() );

        stmt.executeUpdate();
        stmt.close();
    }

    @Override
    public void excluir(DVD obj) throws SQLException {
        
        PreparedStatement stmt = getConnection().prepareStatement(
                "DELETE FROM dvd " + 
                "WHERE" + 
                "    id = ?;" );

        stmt.setInt( 1, obj.getId() );

        stmt.executeUpdate();
        stmt.close();
    }

    @Override
    public List<DVD> listarTodos() throws SQLException {
        
        List<DVD> lista = new ArrayList<>();

        PreparedStatement stmt = getConnection().prepareStatement(
                "SELECT" + 
                "    d.id idDVD, " + 
                "    d.titulo tituloDVD, " +  
                "    d.anoLancamento anoLancamentoDVD, " + 
                "    d.dataLancamento dataLancamentoDVD, " + 
                "    d.duracao duracaoDVD, " + 
                "    a.id idAtorPrincipal, " + 
                "    a.nome nomeAtorPrincipal, " + 
                "    a.sobrenome sobrenomeAtorPrincipal, " +
                "    a.dataEstreia dataEstreiaAtorPrincipal, " +
                "    a2.id idAtorCoadjuvante, " + 
                "    a2.nome nomeAtorCoadjuvante, " + 
                "    a2.sobrenome sobrenomeAtorCoadjuvante, " +
                "    a2.dataEstreia dataEstreiaAtorCoadjuvante, " +
                "    g.id idGenero, " +
                "    g.descricao descricaoGenero, " +
                "    c.id idClassificacao, " + 
                "    c.descricao descricaoClassificacao " +
                "FROM" + 
                "    dvd d, " + 
                "    ator a, " +
                "    ator a2, " +
                "    genero g, " +
                "    classificacao c " + 
                "WHERE" + 
                "    d.atorPrincipal_id = a.id AND " + 
                "    d.atorCoadjuvante_id = a2.id AND " +
                "    d.genero_id = g.id AND " +
                "    d.classificacaoEtaria_id = c.id " +
                "ORDER BY d.id, d.titulo;" );

        ResultSet rs = stmt.executeQuery();

        while ( rs.next() ) {

            DVD d = new DVD();
            Ator aP = new Ator();
            Ator aC = new Ator();
            Genero g = new Genero();
            Classificacao c = new Classificacao();
            
            d.setId( rs.getInt( "idDVD" ) );
            d.setTitulo( rs.getString( "tituloDVD" ) );
            d.setAnoLancamento(rs.getInt( "anoLancamentoDVD" ) );
            d.setDataLancamento( rs.getDate( "dataLancamentoDVD" ) );
            d.setDuracao(rs.getInt( "duracaoDVD" ) );
            d.setGenero(g);
            d.setClassificacaoEtaria(c);
            d.setAtorPrincipal(aP);
            d.setAtorCoadjuvante(aC);
            
            g.setId( rs.getInt( "idGenero" ) );
            g.setDescricao(rs.getString( "descricaoGenero" ) );
            
            c.setId( rs.getInt( "idClassificacao" ) );
            c.setDescricao(rs.getString( "descricaoClassificacao" ) );
            
            aP.setId( rs.getInt( "idAtorPrincipal" ) );
            aP.setNome( rs.getString( "nomeAtorPrincipal" ) );
            aP.setSobrenome( rs.getString( "sobrenomeAtorPrincipal" ) );
            aP.setDataEstreia( rs.getDate( "dataEstreiaAtorPrincipal" ) );
            
            aC.setId( rs.getInt( "idAtorCoadjuvante" ) );
            aC.setNome( rs.getString( "nomeAtorCoadjuvante" ) );
            aC.setSobrenome( rs.getString( "sobrenomeAtorCoadjuvante" ) );
            aC.setDataEstreia( rs.getDate( "dataEstreiaAtorCoadjuvante" ) );
            
            lista.add( d );

        }

        rs.close();
        stmt.close();

        return lista;
    }

    @Override
    public DVD obterPorId(int id) throws SQLException {
        
        DVD dvd = null;

        PreparedStatement stmt = getConnection().prepareStatement(
                "SELECT" + 
                "    d.id idDVD, " + 
                "    d.titulo tituloDVD, " +  
                "    d.anoLancamento anoLancamentoDVD, " + 
                "    d.dataLancamento dataLancamentoDVD, " + 
                "    d.duracao duracaoDVD, " + 
                "    a.id idAtorPrincipal, " + 
                "    a.nome nomeAtorPrincipal, " + 
                "    a.sobrenome sobrenomeAtorPrincipal, " +
                "    a.dataEstreia dataEstreiaAtorPrincipal, " +
                "    a2.id idAtorCoadjuvante, " + 
                "    a2.nome nomeAtorCoadjuvante, " + 
                "    a2.sobrenome sobrenomeAtorCoadjuvante, " +
                "    a2.dataEstreia dataEstreiaAtorCoadjuvante, " +
                "    g.id idGenero, " +
                "    g.descricao descricaoGenero, " +
                "    c.id idClassificacao, " + 
                "    c.descricao descricaoClassificacao " +
                "FROM" + 
                "    dvd d, " + 
                "    ator a, " +
                "    ator a2, " +
                "    genero g, " +
                "    classificacao c " + 
                "WHERE" + 
                "    d.id = ? AND " +
                "    d.atorPrincipal_id = a.id AND " + 
                "    d.atorCoadjuvante_id = a2.id AND " +
                "    d.genero_id = g.id AND " +
                "    d.classificacaoEtaria_id = c.id;");

        stmt.setInt( 1, id );

        ResultSet rs = stmt.executeQuery();

        if ( rs.next() ) {

            dvd = new DVD();
            Ator aP = new Ator();
            Ator aC = new Ator();
            Genero g = new Genero();
            Classificacao c = new Classificacao();
            
            dvd.setId( rs.getInt( "idDVD" ) );
            dvd.setTitulo( rs.getString( "tituloDVD" ) );
            dvd.setAnoLancamento(rs.getInt( "anoLancamentoDVD" ) );
            dvd.setDataLancamento( rs.getDate( "dataLancamentoDVD" ) );
            dvd.setDuracao(rs.getInt( "duracaoDVD" ) );
            dvd.setGenero(g);
            dvd.setClassificacaoEtaria(c);
            dvd.setAtorPrincipal(aP);
            dvd.setAtorCoadjuvante(aC);
            
            g.setId( rs.getInt( "idGenero" ) );
            g.setDescricao(rs.getString( "descricaoGenero" ) );
            
            c.setId( rs.getInt( "idClassificacao" ) );
            c.setDescricao(rs.getString( "descricaoClassificacao" ) );
            
            aP.setId( rs.getInt( "idAtorPrincipal" ) );
            aP.setNome( rs.getString( "nomeAtorPrincipal" ) );
            aP.setSobrenome( rs.getString( "sobrenomeAtorPrincipal" ) );
            aP.setDataEstreia( rs.getDate( "dataEstreiaAtorPrincipal" ) );
            
            aC.setId( rs.getInt( "idAtorCoadjuvante" ) );
            aC.setNome( rs.getString( "nomeAtorCoadjuvante" ) );
            aC.setSobrenome( rs.getString( "sobrenomeAtorCoadjuvante" ) );
            aC.setDataEstreia( rs.getDate( "dataEstreiaAtorCoadjuvante" ) );

        }

        rs.close();
        stmt.close();

        return dvd;
    }
    
}
