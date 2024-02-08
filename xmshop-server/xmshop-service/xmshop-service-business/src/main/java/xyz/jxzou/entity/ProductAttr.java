package xyz.jxzou.entity;

import lombok.Getter;
import lombok.Setter;
import org.springframework.data.annotation.Id;
import org.springframework.data.relational.core.mapping.Column;
import org.springframework.data.relational.core.mapping.Table;

/**
 * The type ProductAttr.
 *
 * @author Jx-zou
 */
@Getter
@Setter
@Table(name = "t_product_attr")
public class ProductAttr {

    @Id
    private String id;

    @Column
    String cate;

    @Column
    String list;
}
