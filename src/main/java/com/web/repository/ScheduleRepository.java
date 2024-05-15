package com.web.repository;

import com.web.entity.Schedule;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.sql.Date;
import java.time.LocalDateTime;
import java.util.List;

@Repository
public interface ScheduleRepository extends JpaRepository<Schedule, Long> {

    @Query("select s from Schedule s where month(s.workoutDate) = ?2 and YEAR(s.workoutDate) = ?3 and s.plan.athlete.coach.id = ?1")
    public List<Schedule> findByCoachAndDate(Long coachId, Integer month, Integer year);

    @Query("select s from Schedule s where month(s.workoutDate) = ?2 and YEAR(s.workoutDate) = ?3 and s.plan.id = ?1")
    public List<Schedule> findByPlanAndDate(Long planId, Integer month, Integer year);

    @Query("select s from Schedule s where month(s.workoutDate) = ?2 and YEAR(s.workoutDate) = ?3 and s.plan.athlete.id = ?1")
    public List<Schedule> findByAthAndDate(Long athId, Integer month, Integer year);

    @Query("select s from Schedule s where s.workoutDate = ?2 and s.plan.athlete.coach.id = ?1")
    public List<Schedule> findByDate(Long coachId, Date date);

    @Query("select s from Schedule s where s.workoutDate = ?2 and s.plan.athlete.id = ?1")
    public List<Schedule> findByDateAndAth(Long athId, Date date);

    @Query("select s from Schedule s where s.plan.athlete.id = ?1 order by s.workoutDate asc")
    public List<Schedule> findByAth(Long athId);

    @Query("select s from Schedule s where s.plan.athlete.id = ?1 and s.workoutDate >= ?2 and s.workoutDate <= ?3 order by s.workoutDate asc")
    public List<Schedule> findByAthAndDate(Long athId, Date start, Date end);

    @Query("select s from Schedule s where s.plan.athlete.coach.id = ?1 and s.feedBackDate >= ?2 and s.feedBackDate <= ?3 order by s.workoutDate asc")
    public List<Schedule> findFeedbackByAthAndDate(Long coachId, LocalDateTime start, LocalDateTime end);
}
