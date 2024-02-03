package xyz.jxzou.entity;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Table;
import lombok.Getter;
import lombok.Setter;

import java.math.BigDecimal;

@Getter
@Setter
@Entity
@Table(name = "t_product")
public class Product extends AbstractSnowFlakeIDEntity {

  @Column(name = "title", nullable = false, length = 64)
  String title;
  @Column(name = "cid", nullable = false, length = 18)
  String cid;
  @Column(name = "price", nullable = false)
  BigDecimal price;
  @Column(name = "pic", length = 256)
  String pic;
  @Column(name = "sub_title", length = 128)
  String subTitle;
  @Column(name = "s_pic", length = 256)
  String sPic;
}
