package com.web.repository;

import com.web.entity.Athlete;
import com.web.entity.AthleteHistory;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface AthleteHistoryRepository extends JpaRepository<AthleteHistory,Long> {

    @Query("select a from AthleteHistory a where a.athlete.id = ?1")
    List<AthleteHistory> findByAthlete(Long athId);
}
