package com.web.api;

import com.web.entity.PhysicalExam;
import com.web.entity.Specialize;
import com.web.entity.User;
import com.web.repository.SpecializeRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.sql.Date;
import java.time.LocalDate;
import java.util.List;

@RestController
@RequestMapping("/api/specialize")
@CrossOrigin
public class SpecializeApi {

    @Autowired
    private SpecializeRepository specializeRepository;

    @PostMapping("/admin/create-update")
    public ResponseEntity<?> save(@RequestBody Specialize specialize){
        Specialize result = specializeRepository.save(specialize);
        return new ResponseEntity<>(result, HttpStatus.CREATED);
    }

    @DeleteMapping("/admin/delete")
    public ResponseEntity<?> delete(@RequestParam("id") Long id){
        specializeRepository.deleteById(id);
        return new ResponseEntity<>(HttpStatus.OK);
    }

    @GetMapping("/all/findAll")
    public ResponseEntity<?> findAll(){
        List<Specialize> list = specializeRepository.findAll();
        return new ResponseEntity<>(list,HttpStatus.OK);
    }

    @GetMapping("/all/findById")
    public ResponseEntity<?> findById(@RequestParam("id") Long id){
        Specialize result = specializeRepository.findById(id).get();
        return new ResponseEntity<>(result,HttpStatus.OK);
    }
}
