package com.web.api;

import com.web.entity.*;
import com.web.enums.Status;
import com.web.repository.AthleteRepository;
import com.web.repository.ExerciseScheduleRepository;
import com.web.repository.ScheduleRepository;
import com.web.utils.UserUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.sql.Date;
import java.time.Instant;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.util.List;

@RestController
@RequestMapping("/api/schedule")
@CrossOrigin
public class ScheduleApi {

    @Autowired
    private ScheduleRepository scheduleRepository;

    @Autowired
    private ExerciseScheduleRepository exerciseScheduleRepository;

    @Autowired
    private UserUtils userUtils;

    @Autowired
    private AthleteRepository athleteRepository;

    @PostMapping("/coach/create-update")
    public ResponseEntity<?> save(@RequestBody Schedule schedule){
        if(schedule.getId() != null){
            exerciseScheduleRepository.deleteBySchedule(schedule.getId());
        }
        Schedule result = scheduleRepository.save(schedule);
        for(ExerciseSchedule e : schedule.getExerciseSchedules()){
            e.setSchedule(result);
            exerciseScheduleRepository.save(e);
        }
        return new ResponseEntity<>(result,HttpStatus.CREATED);
    }

    @GetMapping("/coach/find-by-coach")
    public ResponseEntity<?> findByCoach(@RequestParam("month") Integer month, @RequestParam("year") Integer year){
        User user = userUtils.getUserWithAuthority();
        List<Schedule> result = scheduleRepository.findByCoachAndDate(user.getId(), month, year);
        return new ResponseEntity<>(result, HttpStatus.CREATED);
    }

    @GetMapping("/coach/find-by-vdv")
    public ResponseEntity<?> findByIdVdv(@RequestParam("month") Integer month, @RequestParam("year") Integer year,
                                         @RequestParam("id") Long id){
        List<Schedule> result = scheduleRepository.findByPlanAndDate(id, month, year);
        return new ResponseEntity<>(result, HttpStatus.CREATED);
    }

    @GetMapping("/athlete/my-schedule")
    public ResponseEntity<?> mySchedule(@RequestParam("month") Integer month, @RequestParam("year") Integer year,
                                        @RequestParam(value = "kehoach", required = false) Long keHoachId){
        User user = userUtils.getUserWithAuthority();
        Athlete ex = athleteRepository.findByUser(user.getId());
        Long idAth = ex.getId();

        List<Schedule> result = null;
        if(keHoachId == null){
            result = scheduleRepository.findByAthAndDate(idAth, month, year);
        }
        if(keHoachId != null){
            result = scheduleRepository.findByPlanAndDate(keHoachId, month, year);
        }
        return new ResponseEntity<>(result, HttpStatus.CREATED);
    }

    @GetMapping("/coach/find-by-date")
    public ResponseEntity<?> findByDate(@RequestParam("date") Date date){
        User user = userUtils.getUserWithAuthority();
        List<Schedule> result = scheduleRepository.findByDate(user.getId(), date);
        return new ResponseEntity<>(result, HttpStatus.CREATED);
    }


    @GetMapping("/athlete/find-single-by-date")
    public ResponseEntity<?> findByMyDate(@RequestParam("date") Date date){
        User user = userUtils.getUserWithAuthority();
        Athlete ex = athleteRepository.findByUser(user.getId());
        Long athId = ex.getId();

        List<Schedule> result = scheduleRepository.findByDateAndAth(athId, date);
        return new ResponseEntity<>(result, HttpStatus.CREATED);
    }

    @DeleteMapping("/coach/delete")
    public ResponseEntity<?> delete(@RequestParam("id") Long id){
        scheduleRepository.deleteById(id);
        return new ResponseEntity<>(HttpStatus.OK);
    }

    @GetMapping("/all/findById")
    public ResponseEntity<?> findById(@RequestParam("id") Long id){
        Schedule result = scheduleRepository.findById(id).get();
        return new ResponseEntity<>(result,HttpStatus.OK);
    }

    @PostMapping("/coach/update-status")
    public ResponseEntity<?> updateTrangThai(@RequestParam("id") Long id, @RequestParam(required = false) Status status){
        Schedule result = scheduleRepository.findById(id).get();
        if(status != null){
            result.setStatus(status);
        }
        else{
            result.setStatus(null);
        }
        scheduleRepository.save(result);
        return new ResponseEntity<>(result,HttpStatus.CREATED);
    }

    @GetMapping("/coach/find-by-ath-and-date")
    public ResponseEntity<?> findByAthAndDate(@RequestParam("athId") Long athId, @RequestParam(value = "from") Date from,
                                              @RequestParam(value = "to") Date to){
        List<Schedule> result = scheduleRepository.findByAthAndDate(athId, from, to);
        return new ResponseEntity<>(result,HttpStatus.CREATED);
    }

    @GetMapping("/athlete/find-by-date")
    public ResponseEntity<?> findByDate(@RequestParam(value = "from") Date from,
                                              @RequestParam(value = "to") Date to){
        User user = userUtils.getUserWithAuthority();
        Athlete ex = athleteRepository.findByUser(user.getId());
        Long athId = ex.getId();
        List<Schedule> result = scheduleRepository.findByAthAndDate(athId, from, to);
        return new ResponseEntity<>(result,HttpStatus.CREATED);
    }

    @PostMapping("/athlete/update-feedback")
    public ResponseEntity<?> updateFeedBack(@RequestBody String feedBack, Integer mark, @RequestParam Long id){
        Schedule schedule = scheduleRepository.findById(id).get();
        String status = String.valueOf(schedule.getStatus());
        LocalDate scheduleDate = schedule.getWorkoutDate().toLocalDate(); // Giả sử ngày được lưu trữ dưới dạng LocalDate
        // Kiểm tra xem ngày tập có nằm trong quá khứ hoặc tương lai hay không (loại trừ hôm nay)
        if (scheduleDate.isBefore(LocalDate.now()) || scheduleDate.isAfter(LocalDate.now())) {
            return new ResponseEntity<>("Chỉ có thể phản hồi cho lịch tập hôm nay", HttpStatus.BAD_REQUEST);
        }

        if (status.equals("DA_TAP") || status.equals("DI_MUON")){
            schedule.setFeedBack(feedBack);
            schedule.setMark(mark);
            schedule.setFeedBackDate(LocalDateTime.now());
            scheduleRepository.save(schedule);
            return new ResponseEntity<>(schedule,HttpStatus.CREATED);
        }
        else {
            return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
        }

    }

    @GetMapping("/coach/fin-feedback-by-date")
    public ResponseEntity<?> findFeedBackByDate( @RequestParam(value = "from", required = false) Date from,
                                                 @RequestParam(value = "to", required = false) Date to){
        User user = userUtils.getUserWithAuthority();
        if(from == null || to == null){
            from = Date.valueOf("2000-01-01");
            to = Date.valueOf("2200-01-01");
        }
        long epochMilli = from.getTime();
        LocalDateTime start = Instant.ofEpochMilli(epochMilli)
                .atZone(ZoneId.systemDefault())
                .toLocalDateTime();
        LocalDateTime end = Instant.ofEpochMilli(to.getTime())
                .atZone(ZoneId.systemDefault())
                .toLocalDateTime();

        List<Schedule> result = scheduleRepository.findFeedbackByAthAndDate(user.getId(), start, end);
        return new ResponseEntity<>(result, HttpStatus.CREATED);
    }


}
