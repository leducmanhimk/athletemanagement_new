package com.web.api;

import com.web.entity.Athlete;
import com.web.entity.AthleteHistory;
import com.web.entity.User;
import com.web.exception.MessageException;
import com.web.repository.AthleteHistoryRepository;
import com.web.utils.Contains;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.sql.Date;
import java.time.LocalDate;
import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping("/api/athlete-history")
@CrossOrigin
public class AthleteHistoryApi {

    @Autowired
    private AthleteHistoryRepository athleteHistoryRepository;

    @PostMapping("/expert/create")
    public void create(@RequestBody AthleteHistory athleteHistory, @RequestParam("idvdv") Long idvdv){
        Athlete athlete = new Athlete();
        athlete.setId(idvdv);
        athleteHistory.setAthlete(athlete);
        athleteHistory.setCreatedDate(LocalDate.now());
        athleteHistoryRepository.save(athleteHistory);
    }

    @GetMapping("/expert/get-by-athlete")
    public ResponseEntity<?> findByAthlete(@RequestParam("idvdv") Long idvdv){
        List<AthleteHistory> list = athleteHistoryRepository.findByAthlete(idvdv);
        return new ResponseEntity<>(list, HttpStatus.OK);
    }

}
