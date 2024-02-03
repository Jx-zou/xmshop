package xyz.jxzou.entity;

import com.alibaba.fastjson2.JSON;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Table;
import lombok.Getter;
import lombok.Setter;

import java.math.BigDecimal;
import java.util.List;

@Getter
@Setter
@Entity
@Table(name = "t_product_details")
public class ProductDetails extends AbstractSnowFlakeIDEntity {
  @Column(name = "title", nullable = false, length = 64)
  String title;
  @Column(name = "cid", nullable = false, length = 18)
  String cid;
  @Column(name = "price", nullable = false)
  BigDecimal price;
  @Column(name = "old_price", nullable = false)
  BigDecimal oldPrice;
  @Column(name = "is_best")
  Byte isBest;
  @Column(name = "is_hot")
  Byte isHot;
  @Column(name = "is_new")
  Byte isNew;
  @Column(name = "status")
  Byte status;
  @Column(name = "pic", length = 256)
  String pic;
  @Column(name = "cname", length = 64)
  String cname;
  @Column(name = "sub_title", length = 128)
  String subTitle;
  @Column(name = "content", length = 2048)
  String content;
  @Column(name = "specs", length = 2048)
  String specs;
  @Column(name = "attrs")
  String attrs;

  public void setAttrs(List<ProductAttr> attrs) {
    this.attrs = JSON.toJSONString(attrs);
  }

  public List<ProductAttr> getAttrs() {
    return JSON.parseArray(attrs, ProductAttr.class);
  }
}
