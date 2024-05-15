package com.web.entity;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;
import java.util.List;

@Entity
@Table(name = "plan")
@Getter
@Setter
public class Plan {


    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Long id;

    private String name;

    private Boolean complete;

    @ManyToOne
    @JoinColumn(name = "athlete_id")
    private Athlete athlete;

    @OneToMany(mappedBy = "plan", cascade = CascadeType.REMOVE)
    private List<Schedule> schedules;
}
