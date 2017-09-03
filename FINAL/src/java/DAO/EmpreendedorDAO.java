/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;
import javax.persistence.TypedQuery;
import modelo.Empreendedor;
/**
 *
 * @author paton
 */
public class EmpreendedorDAO extends GenericDAO<Empreendedor, Long> {
    public EmpreendedorDAO() {
       super(Empreendedor.class);
    }   
    public Empreendedor realizarLogin(String Cpf, String senha){
        TypedQuery<Empreendedor>query=em.createNamedQuery("Empreendedor.realizarLogin", Empreendedor.class);
        //seto os parâmetros
        query.setParameter("cpf", Cpf);
        query.setParameter("senha", senha);
        Empreendedor empreendedor;
        try{
            empreendedor = query.getSingleResult();
        }
        catch(Exception e){
            empreendedor = null;
        
        }
         return empreendedor;
    }
    
}