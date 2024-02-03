package xyz.jxzou.entity;

import com.alibaba.fastjson2.JSON;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Table;
import lombok.Getter;
import lombok.Setter;

import java.util.List;

/**
 * The type ProductAttr.
 *
 * @author Jx-zou
 */
@Getter
@Setter
@Entity
@Table(name = "t_product_attr")
public class ProductAttr extends AbstractSnowFlakeIDEntity{

    @Column(name = "cate", nullable = false, length = 128)
    String cate;
    @Column(name = "list")
    String list;

    public void setList(List<String> list) {
        this.list = JSON.toJSONString(list);
    }

    public List<String> getList() {
        return JSON.parseArray(list, String.class);
    }
}
