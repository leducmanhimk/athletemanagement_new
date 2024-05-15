package com.web.entity;

import com.web.dto.RevenueType;
import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;
import java.sql.Date;
import java.time.LocalDate;

@Entity
@Table(name = "revenue_expenditure")
@Getter
@Setter
public class RevenueExpenditure {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Long id;

    private LocalDate createdDate;

    private Date payDate;

    private Double amount;

    private String title;

    private String content;

    private String bill;

    private RevenueType revenueType;

    @ManyToOne
    @JoinColumn(name = "user_id")
    private User user;
}
