package com.web.entity;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;
import java.sql.Date;
import java.time.LocalDate;

@Entity
@Table(name = "injuries")
@Getter
@Setter
public class Injuries {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Long id;

    private Date injuriesDate;

    private LocalDate createdDate;

    private String location;

    private String severity;

    private String status;

    @ManyToOne
    @JoinColumn(name = "athlete_id")
    private Athlete athlete;
}
