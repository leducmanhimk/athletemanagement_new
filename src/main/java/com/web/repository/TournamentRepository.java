package com.web.repository;

import com.web.entity.Athlete;
import com.web.entity.RevenueExpenditure;
import com.web.entity.Tournament;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.sql.Date;
import java.util.List;

@Repository
public interface TournamentRepository extends JpaRepository<Tournament,Long> {

    @Query("select r from Tournament r where r.competitionDay >= ?1 and r.competitionDay <= ?2")
    List<Tournament> findByDate(Date from, Date to);

    @Query("select r from Tournament r where r.competitionDay >= ?1 and r.competitionDay <= ?2 and r.specialize.id = ?3")
    List<Tournament> findByDateAndCm(Date from, Date to, Long specializeId);
}
