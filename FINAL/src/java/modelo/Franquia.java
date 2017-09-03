/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

import java.io.Serializable;
import java.lang.reflect.Array;
import java.util.List;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;

/**
 *
 * @author paton
 */
@Entity
@Table(name = "franquia")
@NamedQueries({
    @NamedQuery(name = "Franquia.filtroCatValor", query = "SELECT f FROM Franquia f where f.valortotal<=:valortotal and f.categoriaList=:categoriaList")
    ,
    @NamedQuery(name = "Franquia.filtroValor", query = "SELECT f FROM Franquia f where f.valortotal<=:valortotal")
    ,
    @NamedQuery(name = "Franquia.filtroCat", query = "SELECT f FROM Franquia f where f.categoriaList=:categoriaList")
    ,
    @NamedQuery(name = "Franquia.findPorFranquiador", query = "SELECT f FROM Franquia f where f.franquiador.cnpj=:cnpj")
    ,
    @NamedQuery(name = "Franquia.filtroProcurar", query = "SELECT f FROM Franquia f where f.nome LIKE :nome")
    ,
    @NamedQuery(name = "Franquia.filtroProcurarCatValor", query = "SELECT f FROM Franquia f where f.nome LIKE :nome and f.valortotal <=:valortotal and f.categoriaList=:categoriaList")
    ,
    @NamedQuery(name = "Franquia.filtroProcurarCat", query = "SELECT f FROM Franquia f where f.nome LIKE :nome and f.categoriaList=:categoriaList")
    ,
    @NamedQuery(name = "Franquia.filtroProcurarValor", query = "SELECT f FROM Franquia f where f.nome LIKE :nome and f.valortotal <=:valortotal")
    ,
    @NamedQuery(name = "Franquia.findAll", query = "SELECT f FROM Franquia f")})
public class Franquia implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "idfranquia")
    private Integer idfranquia;
    @Basic(optional = false)
    @Column(name = "nome")
    private String nome;
    @Basic(optional = false)
    @Column(name = "valortotal")
    private double valortotal;
    @Basic(optional = false)
    @Column(name = "valorinicial")
    private double valorinicial;
    @Basic(optional = false)
    @Column(name = "tempolucro")
    private int tempolucro;
    @Basic(optional = false)
    @Column(name = "descricao")
    private String descricao;
    @Column(name = "foto")
    private String foto;

    public String getFoto() {
        return foto;
    }

    public void setFoto(String foto) {
        this.foto = foto;
    }
    @Basic(optional = false)
    @Column(name = "capital")
    private int capital;

    @JoinTable(name = "pertencer", joinColumns = {
        @JoinColumn(name = "idfranquia", referencedColumnName = "idfranquia")}, inverseJoinColumns = {
        @JoinColumn(name = "idcategoria", referencedColumnName = "idcategoria")}
    )

    @ManyToMany
    private List<Categoria> categoriaList;
    @JoinColumn(name = "cnpj", referencedColumnName = "cnpj")
    @ManyToOne(optional = false)
    private Franquiador franquiador;

    public Franquia() {
    }

    public Franquia(Integer idfranquia) {
        this.idfranquia = idfranquia;
    }

    public Franquia(Integer idfranquia, String nome, double valortotal, double valorinicial, int tempolucro, String descricao, int capital) {
        this.idfranquia = idfranquia;
        this.nome = nome;
        this.valortotal = valortotal;
        this.valorinicial = valorinicial;
        this.tempolucro = tempolucro;
        this.descricao = descricao;
        this.capital = capital;
    }

    public Integer getIdfranquia() {
        return idfranquia;
    }

    public void setIdfranquia(Integer idfranquia) {
        this.idfranquia = idfranquia;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public double getValortotal() {
        return valortotal;
    }

    public void setValortotal(double valortotal) {
        this.valortotal = valortotal;
    }

    public double getValorinicial() {
        return valorinicial;
    }

    public void setValorinicial(double valorinicial) {
        this.valorinicial = valorinicial;
    }

    public int getTempolucro() {
        return tempolucro;
    }

    public void setTempolucro(int tempolucro) {
        this.tempolucro = tempolucro;
    }

    public String getDescricao() {
        return descricao;
    }

    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }

    public int getCapital() {
        return capital;
    }

    public void setCapital(int capital) {
        this.capital = capital;
    }

    public List<Categoria> getCategoriaList() {
        return categoriaList;
    }

    public void setCategoriaList(List<Categoria> categoriaList) {
        this.categoriaList = categoriaList;
    }

    public String getCategoriaListArrumado() {
        StringBuilder sb = new StringBuilder();

        for (Categoria categoria : categoriaList) {
            sb.append(categoria.getNome());
        }
        return sb.toString();
    }

    public Integer getCategoriaListId() {
        StringBuilder sb = new StringBuilder();

        for (Categoria categoria : categoriaList) {
            sb.append(categoria.getIdcategoria());
        }

        return Integer.parseInt(sb.toString());
    }

    public Franquiador getFranquiador() {
        return franquiador;
    }

    public void setFranquiador(Franquiador franquiador) {
        this.franquiador = franquiador;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idfranquia != null ? idfranquia.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Franquia)) {
            return false;
        }
        Franquia other = (Franquia) object;
        if ((this.idfranquia == null && other.idfranquia != null) || (this.idfranquia != null && !this.idfranquia.equals(other.idfranquia))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "modelo.Franquia[ idfranquia=" + idfranquia + " ]";
    }

}
