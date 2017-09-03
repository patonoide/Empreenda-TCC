/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

import java.io.Serializable;
import java.util.List;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;

/**
 *
 * @author paton
 */
@Entity
@Table(name = "empreendedor")

@NamedQueries({
  
    @NamedQuery(name = "Empreendedor.realizarLogin", query = "SELECT e FROM Empreendedor e where e.cpf=:cpf and e.senha=:senha"), 
    @NamedQuery(name = "Empreendedor.findAll", query = "SELECT e FROM Empreendedor e")})
public class Empreendedor implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @Column(name = "cpf")
    private String cpf;
    @Basic(optional = false)
    @Column(name = "nome")
    private String nome;
    @Basic(optional = false)
    @Column(name = "idade")
    private int idade;
    @Basic(optional = false)
    @Column(name = "dinheiro")
    private double dinheiro;
    @Basic(optional = false)
    @Column(name = "contato")
    private String contato;
    @Basic(optional = false)
    @Column(name = "senha")
    private String senha;
    @JoinTable(name = "possuir", joinColumns = {
        
        @JoinColumn(name = "cpf", referencedColumnName = "cpf")}, inverseJoinColumns = {
        @JoinColumn(name = "idcategoria", referencedColumnName = "idcategoria")})
    
     
    
    @ManyToMany
    private List<Categoria> categoriaList;

    public Empreendedor() {
    }

    public Empreendedor(String cpf) {
        this.cpf = cpf;
    }

    public Empreendedor(String cpf, String nome, int idade, double dinheiro, String contato, String senha) {
        this.cpf = cpf;
        this.nome = nome;
        this.idade = idade;
        this.dinheiro = dinheiro;
        this.contato = contato;
        this.senha = senha;
    }

    public String getCpf() {
        return cpf;
    }

    public void setCpf(String cpf) {
        this.cpf = cpf;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public int getIdade() {
        return idade;
    }

    public void setIdade(int idade) {
        this.idade = idade;
    }

    public double getDinheiro() {
        return dinheiro;
    }

    public void setDinheiro(double dinheiro) {
        this.dinheiro = dinheiro;
    }

    public String getContato() {
        return contato;
    }

    public void setContato(String contato) {
        this.contato = contato;
    }

    public String getSenha() {
        return senha;
    }

    public void setSenha(String senha) {
        this.senha = senha;
    }

    public List<Categoria> getCategoriaList() {
        return categoriaList;
    }
     public String getCategoriaListArrumado(){
        StringBuilder sb = new StringBuilder();
        
        for (Categoria categoria : categoriaList) {
            sb.append(categoria.getNome());
        }
            return sb.toString();
        }
    public void setCategoriaList(List<Categoria> categoriaList) {
        this.categoriaList = categoriaList;
    }

    public Integer getCategoriaListId(){
        StringBuilder sb = new StringBuilder();
        
        for (Categoria categoria : categoriaList) {
            sb.append(categoria.getIdcategoria());
        }
        
            return Integer.parseInt(sb.toString());
        }
    @Override
    public int hashCode() {
        int hash = 0;
        hash += (cpf != null ? cpf.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Empreendedor)) {
            return false;
        }
        Empreendedor other = (Empreendedor) object;
        if ((this.cpf == null && other.cpf != null) || (this.cpf != null && !this.cpf.equals(other.cpf))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return cpf ;
    }
    
}
