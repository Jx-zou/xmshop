package xyz.jxzou.entity;


import lombok.Data;
import org.springframework.data.annotation.Id;
import org.springframework.data.relational.core.mapping.Column;
import org.springframework.data.relational.core.mapping.Table;

@Data
@Table(name = "t_category")
public class Category {

    @Id
    private String id;

    @Column
    private String title;

    @Column
    private Byte status;

    @Column
    private String pic;

    @Column
    private String pid;

    @Column
    private Byte sort;

    @Column
    private Byte isBest;

    @Column
    private String productId;
}