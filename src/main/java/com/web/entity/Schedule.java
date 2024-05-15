package com.web.entity;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonManagedReference;
import com.web.enums.Status;
import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;
import java.sql.Date;
import java.sql.Time;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;

@Entity
@Table(name = "schedule")
@Getter
@Setter
public class Schedule {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Long id;

    private Date workoutDate;

    private String startTime;

    private String endTime;

    private String address;

    private String content;

    private String mass;

    private String level;

    private String feedBack;

    private LocalDateTime feedBackDate;

    private String result;

    private Status status;

    private Integer mark;

    @ManyToOne
    @JoinColumn(name = "plan_id")
    @JsonIgnoreProperties(value = {"schedules"})
    private Plan plan;

    @OneToMany(mappedBy = "schedule", cascade = CascadeType.REMOVE)
    @JsonManagedReference
    private List<ExerciseSchedule> exerciseSchedules;
}
