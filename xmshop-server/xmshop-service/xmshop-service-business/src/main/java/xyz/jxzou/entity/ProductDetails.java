package xyz.jxzou.entity;

import lombok.Getter;
import lombok.Setter;
import org.springframework.data.annotation.Id;
import org.springframework.data.relational.core.mapping.Column;
import org.springframework.data.relational.core.mapping.Table;

import java.math.BigDecimal;

@Getter
@Setter
@Table(name = "t_product_details")
public class ProductDetails {

  @Id
  private String id;

  @Column
  String title;

  @Column
  String cid;

  @Column
  BigDecimal price;

  @Column
  BigDecimal oldPrice;

  @Column
  Byte isBest;

  @Column
  Byte isHot;

  @Column
  Byte isNew;

  @Column
  Byte status;

  @Column
  String pic;

  @Column
  String cname;

  @Column
  String subTitle;

  @Column
  String content;

  @Column
  String specs;

  @Column
  String attrs;
}
