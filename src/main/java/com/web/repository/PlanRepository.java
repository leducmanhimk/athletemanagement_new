package com.web.repository;

import com.web.entity.Plan;
import com.web.entity.Schedule;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface PlanRepository extends JpaRepository<Plan, Long> {

    @Query("select p from Plan p where p.athlete.id = ?1")
    public List<Plan> findByAthlete(Long athId);
}
