package xyz.jxzou.entity;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Table;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Entity
@Table(name = "t_category")
public class Category extends AbstractSnowFlakeIDEntity {

    @Column(name = "title", nullable = false, length = 64)
    private String title;

    @Column(name = "status", nullable = false)
    private Byte status;

    @Column(name = "pic", length = 256)
    private String pic;

    @Column(name = "pid", length = 18)
    private String pid;

    @Column(name = "sort")
    private Byte sort;

    @Column(name = "is_best")
    private Byte isBest;

    @Column(name = "product_id", length = 64)
    private String productId;
}