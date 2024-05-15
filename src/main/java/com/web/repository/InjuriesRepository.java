package com.web.repository;

import com.web.entity.ExerciseSchedule;
import com.web.entity.Injuries;
import com.web.entity.PhysicalExam;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.sql.Date;
import java.util.List;

@Repository
public interface InjuriesRepository extends JpaRepository<Injuries, Long> {

    @Query("select i from Injuries i where i.athlete.id = ?1")
    List<Injuries> findByAth(Long id);

    @Query("select i from Injuries i where i.injuriesDate >= ?1 and i.injuriesDate <= ?2")
    List<Injuries> findByDate(Date from, Date to);

    @Query("select i from Injuries i where i.injuriesDate >= ?1 and i.injuriesDate <= ?2 and i.athlete.id = ?3")
    List<Injuries> findByDateAndVdv(Date from, Date to, Long idVdv);
}
