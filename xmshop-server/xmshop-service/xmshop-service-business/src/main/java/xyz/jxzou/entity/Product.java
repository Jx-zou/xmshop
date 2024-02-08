package xyz.jxzou.entity;

import lombok.Getter;
import lombok.Setter;
import org.springframework.data.annotation.Id;
import org.springframework.data.relational.core.mapping.Column;
import org.springframework.data.relational.core.mapping.Table;

import java.math.BigDecimal;

@Getter
@Setter
@Table(name = "t_product")
public class Product {

    @Id
    private String id;

    @Column
    String title;

    @Column
    String cid;

    @Column
    BigDecimal price;

    @Column
    String pic;

    @Column
    String subTitle;

    @Column
    String sPic;
}
