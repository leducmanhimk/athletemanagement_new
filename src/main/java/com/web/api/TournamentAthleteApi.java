package com.web.api;

import com.web.entity.*;
import com.web.exception.MessageException;
import com.web.repository.AthleteRepository;
import com.web.repository.TournamentAthleteRepository;
import com.web.repository.TournamentRepository;
import com.web.utils.UserUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDate;
import java.util.Date;
import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping("/api/tournament-athlete")
@CrossOrigin
public class TournamentAthleteApi {

    @Autowired
    private TournamentAthleteRepository tournamentAthleteRepository;

    @Autowired
    private UserUtils userUtils;

    @Autowired
    AthleteRepository athleteRepository;
    @Autowired
    TournamentRepository tournamentRepository;

    @PostMapping("/athlete/send-request")
    public ResponseEntity<?> save(@RequestParam Long id){
        User user = userUtils.getUserWithAuthority();
        Athlete athlete = athleteRepository.findByUser(user.getId());
        Tournament tournament = tournamentRepository.findById(id).get();
        if (tournamentAthleteRepository.findByAthleteAndTournament(athlete.getId(), tournament.getId()).isPresent()){
            throw new MessageException("Bạn đã đăng ký trận đấu này rồi");
        }
        if (tournament.getCompetitionDay().before(new Date(System.currentTimeMillis()))){
            throw new MessageException("Ngày thi đấu đã kết thúc");
        }
        TournamentAthlete tournamentAthlete = new TournamentAthlete();
        tournamentAthlete.setAthlete(athlete);
        tournamentAthlete.setTournament(tournament);
        tournamentAthlete.setCreatedDate(LocalDate.now());
        tournamentAthlete.setAccepted(false);
        tournamentAthleteRepository.save(tournamentAthlete);
        return new ResponseEntity<>(tournamentAthlete, HttpStatus.CREATED);
    }

    @DeleteMapping("/athlete/delete")
    public ResponseEntity<?> delete(@RequestParam("id") Long id){
        Tournament tournament = tournamentRepository.findById(id).get();
        User user = userUtils.getUserWithAuthority();
        Athlete athlete = athleteRepository.findByUser(user.getId());
        Optional<TournamentAthlete> t = tournamentAthleteRepository.findByAthleteAndTournament(athlete.getId(), tournament.getId());
        if (t.isEmpty()){
            throw new MessageException("Không tìm thấy");
        }
        tournamentAthleteRepository.delete(t.get());
        return new ResponseEntity<>(HttpStatus.OK);
    }

    @GetMapping("/athlete/my-tournament-athlete")
    public ResponseEntity<?> findByUser(){
        User user = userUtils.getUserWithAuthority();
        List<TournamentAthlete> list = tournamentAthleteRepository.findByUser(user.getId());
        return new ResponseEntity<>(list,HttpStatus.OK);
    }

    @GetMapping("/admin/find-by-tournament")
    public ResponseEntity<?> findByTouId(@RequestParam Long id){
        List<TournamentAthlete> list = tournamentAthleteRepository.findByTournamentId(id);
        return new ResponseEntity<>(list,HttpStatus.OK);
    }

    @PostMapping("/admin/accept")
    public ResponseEntity<?> accept(@RequestParam Long id){
        TournamentAthlete tournamentAthlete = tournamentAthleteRepository.findById(id).get();
        if(tournamentAthlete.getAccepted() == null){
            tournamentAthlete.setAccepted(true);
        }
        else if(tournamentAthlete.getAccepted() == false){
            tournamentAthlete.setAccepted(true);
        }
        else if(tournamentAthlete.getAccepted() == true){
            tournamentAthlete.setAccepted(false);
        }
        tournamentAthleteRepository.save(tournamentAthlete);
        return new ResponseEntity<>(tournamentAthlete,HttpStatus.OK);
    }

    @PostMapping("/admin/cap-nhat-noi-dung")
    public ResponseEntity<?> capNhatKetQua(@RequestParam Long id, @RequestBody String noidung){
        TournamentAthlete tournamentAthlete = tournamentAthleteRepository.findById(id).get();
        tournamentAthlete.setResult(noidung);
        tournamentAthleteRepository.save(tournamentAthlete);
        return new ResponseEntity<>(tournamentAthlete,HttpStatus.OK);
    }

}
