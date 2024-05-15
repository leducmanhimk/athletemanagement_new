package com.web.repository;

import com.web.entity.Athlete;
import com.web.entity.Exercise;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ExerciseRepository extends JpaRepository<Exercise,Long> {

    @Query("select e from Exercise e where e.coach.id = ?1")
    List<Exercise> findByCoach(Long id);
}
