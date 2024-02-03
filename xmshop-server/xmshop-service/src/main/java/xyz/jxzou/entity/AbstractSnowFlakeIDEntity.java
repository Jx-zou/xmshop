package xyz.jxzou.entity;

import jakarta.persistence.Column;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.Id;
import jakarta.persistence.MappedSuperclass;
import lombok.Getter;
import lombok.Setter;
import org.hibernate.annotations.GenericGenerator;
import xyz.jxzou.common.SnowFlakeGenerator;

import java.io.Serializable;

/**
 * The type AbstractSnowFlakeIDEntity.
 *
 * @author Jx-zou
 */
@Setter
@Getter
@MappedSuperclass
public abstract class AbstractSnowFlakeIDEntity implements Serializable {

    @Id
    @GeneratedValue(generator = "SNOWFLAKE_ID")
    @GenericGenerator(name = "SNOWFLAKE_ID", type = SnowFlakeGenerator.class)
    @Column(name = "id", nullable = false, length = 18)
    String id;
}
