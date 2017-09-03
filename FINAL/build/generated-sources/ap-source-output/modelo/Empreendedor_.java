package modelo;

import javax.annotation.Generated;
import javax.persistence.metamodel.ListAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;
import modelo.Categoria;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2017-08-01T09:37:38")
@StaticMetamodel(Empreendedor.class)
public class Empreendedor_ { 

    public static volatile SingularAttribute<Empreendedor, Integer> idade;
    public static volatile SingularAttribute<Empreendedor, Double> dinheiro;
    public static volatile SingularAttribute<Empreendedor, String> senha;
    public static volatile SingularAttribute<Empreendedor, String> cpf;
    public static volatile SingularAttribute<Empreendedor, String> nome;
    public static volatile SingularAttribute<Empreendedor, String> contato;
    public static volatile ListAttribute<Empreendedor, Categoria> categoriaList;

}