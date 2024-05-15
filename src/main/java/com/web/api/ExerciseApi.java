package com.web.api;

import com.web.entity.Exercise;
import com.web.entity.Plan;
import com.web.entity.User;
import com.web.repository.ExerciseRepository;
import com.web.utils.UserUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/exercise")
@CrossOrigin
public class ExerciseApi {

    @Autowired
    private ExerciseRepository exerciseRepository;

    @Autowired
    private UserUtils userUtils;


    @PostMapping("/coach/create-update")
    public ResponseEntity<?> save(@RequestBody Exercise exercise){
        User user = userUtils.getUserWithAuthority();
        exercise.setCoach(user);
        Exercise result = exerciseRepository.save(exercise);
        return new ResponseEntity<>(result, HttpStatus.CREATED);
    }

    @GetMapping("/all/find-by-coach")
    public ResponseEntity<?> findByCoach(){
        User user = userUtils.getUserWithAuthority();
        List<Exercise> result = exerciseRepository.findByCoach(user.getId());
        return new ResponseEntity<>(result, HttpStatus.CREATED);
    }


    @DeleteMapping("/coach/delete")
    public ResponseEntity<?> delete(@RequestParam("id") Long id){
        exerciseRepository.deleteById(id);
        return new ResponseEntity<>(HttpStatus.OK);
    }

    @GetMapping("/all/findById")
    public ResponseEntity<?> findById(@RequestParam("id") Long id){
        Exercise result = exerciseRepository.findById(id).get();
        return new ResponseEntity<>(result,HttpStatus.OK);
    }
}
