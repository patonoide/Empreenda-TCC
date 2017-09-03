/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

import java.io.Serializable;
import java.util.List;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 *
 * @author paton
 */
@Entity
@Table(name = "franquiador")

@NamedQueries({
    
    @NamedQuery(name = "Franquiador.realizarLogin", query = "SELECT f FROM Franquiador f where f.cnpj=:cnpj and f.senha=:senha"), 
    @NamedQuery(name = "Franquiador.findAll", query = "SELECT f FROM Franquiador f")})
public class Franquiador implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @Column(name = "cnpj")
    private String cnpj;
    @Basic(optional = false)
    @Column(name = "contato")
    private String contato;
    @Basic(optional = false)
    @Column(name = "nome")
    private String nome;
    @Basic(optional = false)
    @Column(name = "senha")
    private String senha;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "franquiador")
    private List<Franquia> franquiaList;

    public Franquiador() {
    }

    public Franquiador(String cnpj) {
        this.cnpj = cnpj;
    }

    public Franquiador(String cnpj, String contato, String nome, String senha) {
        this.cnpj = cnpj;
        this.contato = contato;
        this.nome = nome;
        this.senha = senha;
    }

    public String getCnpj() {
        return cnpj;
    }

    public void setCnpj(String cnpj) {
        this.cnpj = cnpj;
    }

    public String getContato() {
        return contato;
    }

    public void setContato(String contato) {
        this.contato = contato;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getSenha() {
        return senha;
    }

    public void setSenha(String senha) {
        this.senha = senha;
    }

    public List<Franquia> getFranquiaList() {
        return franquiaList;
    }

    public void setFranquiaList(List<Franquia> franquiaList) {
        this.franquiaList = franquiaList;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (cnpj != null ? cnpj.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Franquiador)) {
            return false;
        }
        Franquiador other = (Franquiador) object;
        if ((this.cnpj == null && other.cnpj != null) || (this.cnpj != null && !this.cnpj.equals(other.cnpj))) {
            return false;
        }
        return true;
    }
    
    @Override
    public String toString() {
        return cnpj;
    }
    
}
