package modelo;

import javax.annotation.Generated;
import javax.persistence.metamodel.ListAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;
import modelo.Empreendedor;
import modelo.Franquia;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2017-08-01T09:37:38")
@StaticMetamodel(Categoria.class)
public class Categoria_ { 

    public static volatile ListAttribute<Categoria, Franquia> franquiaList;
    public static volatile SingularAttribute<Categoria, Integer> idcategoria;
    public static volatile SingularAttribute<Categoria, String> nome;
    public static volatile SingularAttribute<Categoria, String> descricao;
    public static volatile ListAttribute<Categoria, Empreendedor> empreendedorList;

}