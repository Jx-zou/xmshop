package xyz.jxzou.entity;

import lombok.Getter;
import lombok.Setter;
import org.springframework.data.annotation.Id;
import org.springframework.data.relational.core.mapping.Column;
import org.springframework.data.relational.core.mapping.Table;

@Getter
@Setter
@Table(name = "t_focus")
public class Focus {

    @Id
    private String id;

    @Column
    private String title;

    @Column
    private Byte status = 1;

    @Column
    private String pic;

    @Column
    private String url;

    @Column
    private Integer position;
}