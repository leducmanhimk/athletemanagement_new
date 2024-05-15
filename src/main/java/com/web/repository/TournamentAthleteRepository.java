package com.web.repository;

import com.web.entity.Athlete;
import com.web.entity.TournamentAthlete;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface TournamentAthleteRepository extends JpaRepository<TournamentAthlete,Long> {

    @Query("select t from TournamentAthlete t where t.athlete.id = ?1 and t.tournament.id = ?2")
    Optional<TournamentAthlete> findByAthleteAndTournament(Long athId, Long touId);

    @Query("select t from TournamentAthlete t where t.athlete.user.id = ?1")
    List<TournamentAthlete> findByUser(Long userId);

    @Query("select t from TournamentAthlete t where t.tournament.id = ?1")
    List<TournamentAthlete> findByTournamentId(Long touId);
}
