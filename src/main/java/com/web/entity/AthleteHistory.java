package com.web.entity;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;
import java.time.LocalDate;

@Entity
@Table(name = "athlete_history")
@Getter
@Setter
public class AthleteHistory {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Long id;

    private Float height;

    private Float weight;

    private Float bmi;

    private String bloodPressure;

    private String heartbeat;

    private String stress;

    private String bloodGroup;

    private String pathological;

    private String glycemicIndex;

    private String physicalClassification;

    private String physical;

    private LocalDate createdDate;

    @ManyToOne
    @JoinColumn(name = "athlete_id")
    private Athlete athlete;
}
