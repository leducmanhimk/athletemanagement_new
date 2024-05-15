package com.web.api;

import com.web.entity.Athlete;
import com.web.entity.Plan;
import com.web.entity.Schedule;
import com.web.entity.User;
import com.web.repository.AthleteRepository;
import com.web.repository.PlanRepository;
import com.web.utils.UserUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.sql.Date;
import java.util.List;

@RestController
@RequestMapping("/api/plan")
@CrossOrigin
public class PlanApi {

    @Autowired
    private PlanRepository planRepository;

    @Autowired
    private UserUtils userUtils;

    @Autowired
    private AthleteRepository athleteRepository;

    @PostMapping("/coach/create-update")
    public ResponseEntity<?> save(@RequestBody Plan plan){
        Plan result = planRepository.save(plan);
        return new ResponseEntity<>(result, HttpStatus.CREATED);
    }

    @GetMapping("/all/find-by-athlete")
    public ResponseEntity<?> findByAthlete(@RequestParam("id") Long id){
        List<Plan> result = planRepository.findByAthlete(id);
        return new ResponseEntity<>(result, HttpStatus.CREATED);
    }

    @GetMapping("/athlete/my-plan")
    public ResponseEntity<?> myPlan(){
        User user = userUtils.getUserWithAuthority();
        Athlete ex = athleteRepository.findByUser(user.getId());
        Long id = ex.getId();
        List<Plan> result = planRepository.findByAthlete(id);
        return new ResponseEntity<>(result, HttpStatus.CREATED);
    }


    @DeleteMapping("/coach/delete")
    public ResponseEntity<?> delete(@RequestParam("id") Long id){
        planRepository.deleteById(id);
        return new ResponseEntity<>(HttpStatus.OK);
    }

    @GetMapping("/all/findById")
    public ResponseEntity<?> findById(@RequestParam("id") Long id){
        Plan result = planRepository.findById(id).get();
        return new ResponseEntity<>(result,HttpStatus.OK);
    }
}
