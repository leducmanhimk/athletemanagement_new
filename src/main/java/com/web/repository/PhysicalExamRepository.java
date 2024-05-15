package com.web.repository;

import com.web.entity.Athlete;
import com.web.entity.PhysicalExam;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.sql.Date;
import java.util.List;

@Repository
public interface PhysicalExamRepository extends JpaRepository<PhysicalExam,Long> {

    @Query("select p from PhysicalExam p where p.examDay >= ?1 and p.examDay <= ?2")
    List<PhysicalExam> findByDate(Date from, Date to);
}
