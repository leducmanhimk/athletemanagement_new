package com.web.api;

import com.web.entity.Injuries;
import com.web.entity.PhysicalExam;
import com.web.entity.User;
import com.web.repository.InjuriesRepository;
import com.web.utils.UserUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.relational.core.sql.In;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.sql.Date;
import java.time.LocalDate;
import java.util.List;

@RestController
@RequestMapping("/api/injuries")
@CrossOrigin
public class InjuriesApi {

    @Autowired
    private InjuriesRepository injuriesRepository;

    @Autowired
    private UserUtils userUtils;

    @PostMapping("/expert/create-update")
    public ResponseEntity<?> save(@RequestBody Injuries injuries){
        if(injuries.getId() == null){
            injuries.setCreatedDate(LocalDate.now());
        }
        else{
            Injuries p = injuriesRepository.findById(injuries.getId()).get();
            injuries.setCreatedDate(p.getCreatedDate());
        }
        Injuries result = injuriesRepository.save(injuries);
        return new ResponseEntity<>(result, HttpStatus.CREATED);
    }

    @DeleteMapping("/expert/delete")
    public ResponseEntity<?> delete(@RequestParam("id") Long id){
        injuriesRepository.deleteById(id);
        return new ResponseEntity<>(HttpStatus.OK);
    }

    @GetMapping("/expert/findAll")
    public ResponseEntity<?> findAll(@RequestParam(value = "from",required = false) Date from,
                                     @RequestParam(value = "to",required = false) Date to,
                                     @RequestParam(value = "idvdv",required = false) Long idvdv){
        if(from == null || to == null){
            from = Date.valueOf("2000-01-01");
            to = Date.valueOf("2200-01-01");
        }
        List<Injuries> list = null;
        if(idvdv == null){
            list = injuriesRepository.findByDate(from, to);
        }
        else{
            list = injuriesRepository.findByDateAndVdv(from, to, idvdv);
        }
        return new ResponseEntity<>(list,HttpStatus.OK);
    }

    @GetMapping("/expert/findById")
    public ResponseEntity<?> findById(@RequestParam("id") Long id){
        Injuries result = injuriesRepository.findById(id).get();
        return new ResponseEntity<>(result,HttpStatus.OK);
    }
}
