package com.web.repository;

import com.web.dto.RevenueType;
import com.web.entity.Athlete;
import com.web.entity.RevenueExpenditure;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.sql.Date;
import java.util.List;

@Repository
public interface RevenueExpenditureRepository extends JpaRepository<RevenueExpenditure,Long> {

    @Query("select r from RevenueExpenditure r where r.payDate >= ?1 and r.payDate <= ?2")
    List<RevenueExpenditure> findByDate(Date from, Date to);

    @Query(value = "select sum(r.amount) from RevenueExpenditure r where Month(r.payDate) = ?1 and YEAR(r.payDate) = ?2 and r.revenueType = ?3")
    Double calDt(int i, Integer year, RevenueType revenueType);
}
