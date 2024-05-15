package com.web.repository;

import com.web.entity.ExerciseSchedule;
import com.web.entity.Schedule;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import javax.transaction.Transactional;

@Repository
public interface ExerciseScheduleRepository extends JpaRepository<ExerciseSchedule, Long> {

    @Modifying
    @Transactional
    @Query("delete from ExerciseSchedule p where p.schedule.id = ?1")
    int deleteBySchedule(Long productId);
}
