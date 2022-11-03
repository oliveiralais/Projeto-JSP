package locacaodvds.entidades;

import java.sql.Date;

/**
 *
 * @author Lais
 */
public class DVD {
    
    private int id;
    private String titulo;
    private int anoLancamento;
    private Ator atorPrincipal;
    private Ator atorCoadjuvante;
    private Date dataLancamento; 
    private int duracao; //em minutos
    private Genero genero;
    private Classificacao classificacao;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitulo() {
        return titulo;
    }

    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }

    public int getAnoLancamento() {
        return anoLancamento;
    }

    public void setAnoLancamento(int anoLancamento) {
        this.anoLancamento = anoLancamento;
    }

    public Ator getAtorPrincipal() {
        return atorPrincipal;
    }

    public void setAtorPrincipal(Ator atorPrincipal) {
        this.atorPrincipal = atorPrincipal;
    }

    public Ator getAtorCoadjuvante() {
        return atorCoadjuvante;
    }

    public void setAtorCoadjuvante(Ator atorCoadjuvante) {
        this.atorCoadjuvante = atorCoadjuvante;
    }

    public Date getDataLancamento() {
        return dataLancamento;
    }

    public void setDataLancamento(Date dataLancamento) {
        this.dataLancamento = dataLancamento;
    }

    public int getDuracao() {
        return duracao;
    }

    public void setDuracao(int duracao) {
        this.duracao = duracao;
    }

    public Genero getGenero() {
        return genero;
    }

    public void setGenero(Genero genero) {
        this.genero = genero;
    }

    public Classificacao getClassificacao() {
        return classificacao;
    }

    public void setClassificacaoEtaria(Classificacao classificacao) {
        this.classificacao = classificacao;
    }
 
}
