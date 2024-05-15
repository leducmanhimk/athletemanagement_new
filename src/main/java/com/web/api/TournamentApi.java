package com.web.api;

import com.web.entity.*;
import com.web.repository.AthleteHistoryRepository;
import com.web.repository.AthleteRepository;
import com.web.repository.TournamentAthleteRepository;
import com.web.repository.TournamentRepository;
import com.web.utils.UserUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.sql.Date;
import java.time.LocalDate;
import java.util.List;

@RestController
@RequestMapping("/api/tournament")
@CrossOrigin
public class TournamentApi {

    @Autowired
    private TournamentRepository tournamentRepository;

    @Autowired
    private UserUtils userUtils;

    @Autowired
    private TournamentAthleteRepository tournamentAthleteRepository;

    @Autowired
    private AthleteRepository athleteRepository;

    @PostMapping("/admin/create-update")
    public ResponseEntity<?> save(@RequestBody Tournament tournament){
        if(tournament.getId() == null){
            tournament.setCreatedDate(LocalDate.now());
        }
        else{
            Tournament t = tournamentRepository.findById(tournament.getId()).get();
            tournament.setCreatedDate(t.getCreatedDate());
            tournament.setLockRegis(t.getLockRegis());
        }
        Tournament result = tournamentRepository.save(tournament);
        return new ResponseEntity<>(result, HttpStatus.CREATED);
    }

    @DeleteMapping("/admin/delete")
    public ResponseEntity<?> delete(@RequestParam("id") Long id){
        tournamentRepository.deleteById(id);
        return new ResponseEntity<>(HttpStatus.OK);
    }

    @GetMapping("/all/findAll")
    public ResponseEntity<?> findAll(@RequestParam(value = "from",required = false) Date from,
                                     @RequestParam(value = "to",required = false) Date to){
        if(from == null || to == null){
            from = Date.valueOf("2000-01-01");
            to = Date.valueOf("2200-01-01");
        }
        List<Tournament> list = tournamentRepository.findByDate(from, to);
        return new ResponseEntity<>(list,HttpStatus.OK);
    }

    @GetMapping("/athlete/findAll")
    public ResponseEntity<?> findAllByAth(@RequestParam(value = "from",required = false) Date from,
                                     @RequestParam(value = "to",required = false) Date to){
        if(from == null || to == null){
            from = Date.valueOf("2000-01-01");
            to = Date.valueOf("2200-01-01");
        }
        User user = userUtils.getUserWithAuthority();
        Athlete athlete = athleteRepository.findByUser(user.getId());
        List<TournamentAthlete> tournamentAthletes = tournamentAthleteRepository.findByUser(user.getId());

        List<Tournament> list = tournamentRepository.findByDateAndCm(from, to, athlete.getSpecialize().getId());
        for(Tournament t : list){
            for(TournamentAthlete ta : tournamentAthletes){
                if(t.getId() == ta.getTournament().getId()){
                    t.setDaDangKy(true);
                }
            }
        }
        return new ResponseEntity<>(list,HttpStatus.OK);
    }

    @GetMapping("/all/findById")
    public ResponseEntity<?> findById(@RequestParam("id") Long id){
        Tournament result = tournamentRepository.findById(id).get();
        return new ResponseEntity<>(result,HttpStatus.OK);
    }

    @PostMapping("/admin/lock-unlock-regis")
    public ResponseEntity<?> lockOrUnlock(@RequestParam("id") Long id){
        Tournament result = tournamentRepository.findById(id).get();
        if(result.getLockRegis() == null){
            result.setLockRegis(true);
        } else if (result.getLockRegis() == true) {
            result.setLockRegis(false);
        }else if (result.getLockRegis() == false) {
            result.setLockRegis(true);
        }
        tournamentRepository.save(result);
        return new ResponseEntity<>(result,HttpStatus.OK);
    }

}
