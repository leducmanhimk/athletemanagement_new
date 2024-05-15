package com.web.entity;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;
import java.sql.Date;

@Entity
@Table(name = "athlete")
@Getter
@Setter
public class Athlete {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Long id;

    private Date dob;

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

    private String description;

    @OneToOne(cascade = CascadeType.REMOVE)
    @JoinColumn(name = "user_id")
    private User user;

    @ManyToOne
    @JoinColumn(name = "specialize_id")
    private Specialize specialize;

    @ManyToOne
    @JoinColumn(name = "coach")
    private User coach;
}
