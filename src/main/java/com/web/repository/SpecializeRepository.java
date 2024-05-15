package com.web.repository;

import com.web.entity.Athlete;
import com.web.entity.Specialize;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface SpecializeRepository extends JpaRepository<Specialize,Long> {
}
