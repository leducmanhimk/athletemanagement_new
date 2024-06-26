package com.web.api;

import com.web.dto.AthleteResponse;
import com.web.entity.*;
import com.web.exception.MessageException;
import com.web.repository.*;
import com.web.utils.Contains;
import com.web.utils.MailService;
import com.web.utils.UserUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.sql.Date;
import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping("/api/athlete")
@CrossOrigin
public class AthleteApi {

    @Autowired
    private AthleteRepository athleteRepository;

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private UserUtils userUtils;

    @Autowired
    private MailService mailService;

    @Autowired
    private AthleteHistoryRepository athleteHistoryRepository;

    @Autowired
    private PhysicalExamRepository physicalExamRepository;

    @Autowired
    private TournamentAthleteRepository tournamentAthleteRepository;

    @Autowired
    private PlanRepository planRepository;

    @Autowired
    private InjuriesRepository injuriesRepository;

    @Autowired
    private ScheduleRepository scheduleRepository;

    @PostMapping("/admin/create")
    public Athlete create(@RequestBody Athlete athlete){
        User user = athlete.getUser();
        Optional<User> us = userRepository.findByEmail(user.getEmail());
        if(us.isPresent()){
            throw new MessageException("Email đã được sử dụng");
        }
        user.setCreatedDate(new Date(System.currentTimeMillis()));
        user.setActived(true);
        user.setRole(Contains.ROLE_ATHLETE);
        String randompass = userUtils.randomPass();
        user.setPassword(randompass);
        mailService.sendEmail(user.getEmail(), "Mật khẩu tài khoản","Xử dụng email: "+user.getEmail()+" để đăng nhập<br>" +
                "Đây là mật khẩu của bạn, không được chia sẻ với bất kỳ ai<br><br>" +
                "<a style=\"background-color: #2f5fad; padding: 10px; color: #fff; font-size: 18px; font-weight: bold;\">"+user.getPassword()+"</a>",false, true);
        user = userRepository.save(user);
        athlete.setUser(user);
        athleteRepository.save(athlete);
        return athlete;
    }


    @PostMapping("/admin/update")
    public Athlete update(@RequestBody Athlete athlete){
        User user = athlete.getUser();
        Athlete at = athleteRepository.findById(athlete.getId()).get();

        Optional<User> ex = userRepository.findByEmailAndId(user.getEmail(), user.getId());
        if(ex.isPresent()){
            throw new MessageException("Email đã được sử dụng");
        }

        user.setId(at.getUser().getId());
        user.setCreatedDate(at.getUser().getCreatedDate());
        user.setActived(at.getUser().getActived());
        user.setRole(Contains.ROLE_ATHLETE);
        user.setPassword(at.getUser().getPassword());
        User resultUser = userRepository.save(user);
        athlete.setUser(resultUser);

        athleteRepository.save(athlete);
        return athlete;
    }



    @GetMapping("/all/find-by-id")
    public ResponseEntity<?> findById(@RequestParam Long id){
        Athlete athlete = athleteRepository.findById(id).get();
        return new ResponseEntity<>(athlete, HttpStatus.OK);
    }

    @DeleteMapping("/admin/delete")
    public ResponseEntity<?> delete(@RequestParam("id") Long id){
        try {
            athleteRepository.deleteById(id);
        }catch (Exception e){
            throw new MessageException("Không thể xóa");
        }
        return new ResponseEntity<>(HttpStatus.OK);
    }

    @GetMapping("/admin/get-all")
    public ResponseEntity<?> findAll(){
        List<Athlete> list = athleteRepository.findAll();
        return new ResponseEntity<>(list, HttpStatus.OK);
    }

    @GetMapping("/expert/get-all")
    public ResponseEntity<?> findByExpert(){
        List<Athlete> list = athleteRepository.findAll();
        return new ResponseEntity<>(list, HttpStatus.OK);
    }


    @GetMapping("/coach/get-by-coach")
    public ResponseEntity<?> findByCoach(){
        User user = userUtils.getUserWithAuthority();
        List<Athlete> list = athleteRepository.findByCoach(user.getId());
        return new ResponseEntity<>(list, HttpStatus.OK);
    }

    @GetMapping("/athlete/get-by-user")
    public ResponseEntity<?> findByAthlete(){
        User user = userUtils.getUserWithAuthority();
        Athlete athlete = athleteRepository.findByUser(user.getId());
        return new ResponseEntity<>(athlete, HttpStatus.OK);
    }

    @GetMapping("/athlete/update-infor")
    public ResponseEntity<?> updateInfor(@RequestBody Athlete athlete){
        User user = userUtils.getUserWithAuthority();
        Athlete ex = athleteRepository.findByUser(user.getId());
        ex.setDescription(athlete.getDescription());
        ex.setDob(athlete.getDob());
        ex.setHeight(athlete.getHeight());
        ex.setWeight(athlete.getWeight());
        athleteRepository.save(ex);
        return new ResponseEntity<>(ex, HttpStatus.OK);
    }


    @PostMapping("/expert/update-infor")
    public Athlete updateTt(@RequestBody Athlete athlete){
        Athlete a = athleteRepository.findById(athlete.getId()).get();
        athlete.setUser(a.getUser());
        athlete.setDescription(a.getDescription());
        athlete.setSpecialize(a.getSpecialize());
        athlete.setCoach(a.getCoach());
        athlete.setDob(a.getDob());
        athleteRepository.save(athlete);
        return athlete;
    }

    @GetMapping("/coach/full-infor")
    public AthleteResponse fullInfor(@RequestParam Long id){
        AthleteResponse athleteResponse = new AthleteResponse();
        Athlete athlete = athleteRepository.findById(id).get();
        athleteResponse.setAthlete(athlete);
        List<AthleteHistory> athleteHistories = athleteHistoryRepository.findByAthlete(athlete.getId());
        athleteResponse.setAthleteHistories(athleteHistories);
        List<TournamentAthlete> tournamentAthletes = tournamentAthleteRepository.findByUser(athlete.getUser().getId());
        athleteResponse.setTournamentAthletes(tournamentAthletes);
        List<Plan> plans = planRepository.findByAthlete(athlete.getId());
        athleteResponse.setPlans(plans);
        List<Injuries> injuries = injuriesRepository.findByAth(athlete.getId());
        athleteResponse.setInjuries(injuries);
        List<Schedule> schedules = scheduleRepository.findByAth(athlete.getId());
        athleteResponse.setSchedules(schedules);
        return athleteResponse;
    }
    @GetMapping("/admin/full-infor")
    public AthleteResponse AdminfullInfor(@RequestParam Long id){
        AthleteResponse athleteResponse = new AthleteResponse();
        Athlete athlete = athleteRepository.findById(id).get();
        athleteResponse.setAthlete(athlete);
        List<AthleteHistory> athleteHistories = athleteHistoryRepository.findByAthlete(athlete.getId());
        athleteResponse.setAthleteHistories(athleteHistories);
        List<TournamentAthlete> tournamentAthletes = tournamentAthleteRepository.findByUser(athlete.getUser().getId());
        athleteResponse.setTournamentAthletes(tournamentAthletes);
        List<Plan> plans = planRepository.findByAthlete(athlete.getId());
        athleteResponse.setPlans(plans);
        List<Injuries> injuries = injuriesRepository.findByAth(athlete.getId());
        athleteResponse.setInjuries(injuries);
        List<Schedule> schedules = scheduleRepository.findByAth(athlete.getId());
        athleteResponse.setSchedules(schedules);
        return athleteResponse;
    }

    @GetMapping("/athlete/my-full-infor")
    public AthleteResponse myFullInfor(){
        User user = userUtils.getUserWithAuthority();
        Athlete ex = athleteRepository.findByUser(user.getId());
        Long id = ex.getId();
        AthleteResponse athleteResponse = new AthleteResponse();
        Athlete athlete = athleteRepository.findById(id).get();
        athleteResponse.setAthlete(athlete);
        List<AthleteHistory> athleteHistories = athleteHistoryRepository.findByAthlete(athlete.getId());
        athleteResponse.setAthleteHistories(athleteHistories);
        List<TournamentAthlete> tournamentAthletes = tournamentAthleteRepository.findByUser(athlete.getUser().getId());
        athleteResponse.setTournamentAthletes(tournamentAthletes);
        List<Plan> plans = planRepository.findByAthlete(athlete.getId());
        athleteResponse.setPlans(plans);
        List<Injuries> injuries = injuriesRepository.findByAth(athlete.getId());
        athleteResponse.setInjuries(injuries);
        List<Schedule> schedules = scheduleRepository.findByAth(athlete.getId());
        athleteResponse.setSchedules(schedules);
        return athleteResponse;
    }
}
