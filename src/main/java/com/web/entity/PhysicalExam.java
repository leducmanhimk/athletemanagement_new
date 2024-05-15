package com.web.entity;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;
import java.sql.Date;
import java.time.LocalDate;

@Entity
@Table(name = "physical_exam")
@Getter
@Setter
public class PhysicalExam {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Long id;

    private String name;

    private Date examDay;

    private String examPlace;

    private LocalDate createdDate;

    private String result;

    private String linkResult;

    @ManyToOne
    @JoinColumn(name = "sports_expert")
    private User createdBy;

    @ManyToOne
    @JoinColumn(name = "athlete_id")
    private Athlete athlete;
}
