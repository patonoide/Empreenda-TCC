/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import java.util.List;
import javax.persistence.TypedQuery;
import modelo.Categoria;
import modelo.Franquia;

/**
 *
 * @author paton
 */
public class FranquiaDAO extends GenericDAO<Franquia, Integer> {

    public FranquiaDAO() {
        super(Franquia.class);
    }

    public List<Franquia> listarPorFranquiador(String cnpj) {
        TypedQuery<Franquia> query = em.createNamedQuery("Franquia.findPorFranquiador", Franquia.class);
        query.setParameter("cnpj", cnpj);
        return query.getResultList();
    }

    public List<Franquia> filtroCat(Categoria categoriaList) {
        TypedQuery<Franquia> query = em.createNamedQuery("Franquia.filtroCat", Franquia.class);
        query.setParameter("categoriaList", categoriaList);
        return query.getResultList();
    }

    public List<Franquia> filtroValor(Double valortotal) {
        TypedQuery<Franquia> query = em.createNamedQuery("Franquia.filtroValor", Franquia.class);
        query.setParameter("valortotal", valortotal);
        return query.getResultList();
    }

    public List<Franquia> filtroCatValor(Double valortotal, Categoria categoriaList) {
        TypedQuery<Franquia> query = em.createNamedQuery("Franquia.filtroCatValor", Franquia.class);
        query.setParameter("valortotal", valortotal);
        query.setParameter("categoriaList", categoriaList);
        return query.getResultList();
    }

    public List<Franquia> filtroPesquisar(String nome) {
        TypedQuery<Franquia> query = em.createNamedQuery("Franquia.filtroProcurar", Franquia.class);
        query.setParameter("nome", "%" + nome + "%");
        return query.getResultList();
    }

    public List<Franquia> filtroPesquisarCat(String nome, Categoria categoriaList) {
        TypedQuery<Franquia> query = em.createNamedQuery("Franquia.filtroProcurarCat", Franquia.class);
        query.setParameter("nome", "%" + nome + "%");
        query.setParameter("categoriaList", categoriaList);
        return query.getResultList();
    }

    public List<Franquia> filtroPesquisarCatValor(String nome, Categoria categoriaList, Double valortotal) {
        TypedQuery<Franquia> query = em.createNamedQuery("Franquia.filtroProcurarCatValor", Franquia.class);
        query.setParameter("nome", "%" + nome + "%");
        query.setParameter("categoriaList", categoriaList);
        query.setParameter("valortotal", valortotal);
        return query.getResultList();
    }

    public List<Franquia> filtroPesquisarValor(String nome, Double valortotal) {
        TypedQuery<Franquia> query = em.createNamedQuery("Franquia.filtroProcurarValor", Franquia.class);
        query.setParameter("nome", "%" + nome + "%");
        query.setParameter("valortotal", valortotal);
        return query.getResultList();
    }
}
