package xyz.jxzou.entity;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Table;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Entity
@Table(name = "t_focus")
public class Focus extends AbstractSnowFlakeIDEntity {

    @Column(name = "title", nullable = false, length = 128)
    private String title;

    @Column(name = "status", nullable = false)
    private Byte status = 1;

    @Column(name = "pic", length = 256)
    private String pic;

    @Column(name = "url", length = 256)
    private String url;

    @Column(name = "position")
    private Integer position;
}