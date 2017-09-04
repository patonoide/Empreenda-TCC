/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;

/**
 *
 * @author Asus
 */
@Entity
@Table(name = "avalia")
@NamedQueries({
    @NamedQuery(name = "Avalia.findAll", query = "SELECT a FROM Avalia a")})
public class Avalia implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "idavalia")
    private Integer idavalia;
    @Column(name = "comentario")
    private String comentario;
    @Column(name = "email")
    private String email;
    @Basic(optional = false)
    @Column(name = "nome")
    private String nome;

    public Avalia() {
    }

    public Avalia(Integer idavalia) {
        this.idavalia = idavalia;
    }

    public Avalia(Integer idavalia, String nome) {
        this.idavalia = idavalia;
        this.nome = nome;
    }

    public Integer getIdavalia() {
        return idavalia;
    }

    public void setIdavalia(Integer idavalia) {
        this.idavalia = idavalia;
    }

    public String getComentario() {
        return comentario;
    }

    public void setComentario(String comentario) {
        this.comentario = comentario;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idavalia != null ? idavalia.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Avalia)) {
            return false;
        }
        Avalia other = (Avalia) object;
        if ((this.idavalia == null && other.idavalia != null) || (this.idavalia != null && !this.idavalia.equals(other.idavalia))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "DAO.Avalia[ idavalia=" + idavalia + " ]";
    }
    
}
