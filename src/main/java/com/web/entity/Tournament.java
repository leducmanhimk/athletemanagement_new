package com.web.entity;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;
import java.sql.Date;
import java.time.LocalDate;

@Entity
@Table(name = "tournament")
@Getter
@Setter
public class Tournament {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Long id;

    private String name;

    private String description;

    private String content;

    private LocalDate createdDate;

    private Date competitionDay;

    private Boolean lockRegis;

    @ManyToOne
    @JoinColumn(name = "specialize_id")
    private Specialize specialize;

    @Transient
    private Boolean daDangKy = false;
}
