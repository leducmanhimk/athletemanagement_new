package com.web.api;

import com.web.entity.PhysicalExam;
import com.web.entity.User;
import com.web.repository.PhysicalExamRepository;
import com.web.utils.UserUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import java.sql.Date;
import java.time.LocalDate;
import java.util.List;

@RestController
@RequestMapping("/api/physical-exam")
@CrossOrigin
public class PhysicalExamApi {

    @Autowired
    private PhysicalExamRepository physicalExamRepository;

    @Autowired
    private UserUtils userUtils;

    @PostMapping("/expert/create-update")
    public ResponseEntity<?> save(@RequestBody PhysicalExam physicalExam){
        if(physicalExam.getId() == null){
            User user = userUtils.getUserWithAuthority();
            physicalExam.setCreatedBy(user);
            physicalExam.setCreatedDate(LocalDate.now());
        }
        else{
            PhysicalExam p = physicalExamRepository.findById(physicalExam.getId()).get();
            physicalExam.setCreatedBy(p.getCreatedBy());
            physicalExam.setCreatedDate(p.getCreatedDate());
        }
        PhysicalExam result = physicalExamRepository.save(physicalExam);
        return new ResponseEntity<>(result, HttpStatus.CREATED);
    }

    @DeleteMapping("/expert/delete")
    public ResponseEntity<?> delete(@RequestParam("id") Long id){
        physicalExamRepository.deleteById(id);
        return new ResponseEntity<>(HttpStatus.OK);
    }

    @GetMapping("/expert/findAll")
    public ResponseEntity<?> findAll(@RequestParam(value = "from",required = false) Date from,
                                     @RequestParam(value = "to",required = false) Date to){
        if(from == null || to == null){
            from = Date.valueOf("2000-01-01");
            to = Date.valueOf("2200-01-01");
        }
        System.out.println(from);
        System.out.println(to);
        List<PhysicalExam> list = physicalExamRepository.findByDate(from, to);
        return new ResponseEntity<>(list,HttpStatus.OK);
    }

    @GetMapping("/expert/findById")
    public ResponseEntity<?> findById(@RequestParam("id") Long id){
        PhysicalExam result = physicalExamRepository.findById(id).get();
        return new ResponseEntity<>(result,HttpStatus.OK);
    }
}
