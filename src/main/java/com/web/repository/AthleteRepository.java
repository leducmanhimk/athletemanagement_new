package com.web.repository;

import com.web.entity.Athlete;
import com.web.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface AthleteRepository extends JpaRepository<Athlete,Long> {

    @Query("select a from Athlete a where a.coach.id = ?1")
    List<Athlete> findByCoach(Long coachId);

    @Query("select a from Athlete a where a.user.id = ?1")
    Athlete findByUser(Long userId);
}
