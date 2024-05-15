package com.web.api;

import com.web.entity.PhysicalExam;
import com.web.entity.RevenueExpenditure;
import com.web.entity.User;
import com.web.repository.RevenueExpenditureRepository;
import com.web.utils.UserUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.sql.Date;
import java.time.LocalDate;
import java.util.List;

@RestController
@RequestMapping("/api/revenue-expenditure")
@CrossOrigin
public class RevenueExpenditureApi {

    @Autowired
    private RevenueExpenditureRepository revenueExpenditureRepository;

    @Autowired
    private UserUtils userUtils;

    @PostMapping("/admin/create-update")
    public ResponseEntity<?> save(@RequestBody RevenueExpenditure revenueExpenditure){
        if(revenueExpenditure.getId() == null){
            User user = userUtils.getUserWithAuthority();
            revenueExpenditure.setUser(user);
            revenueExpenditure.setCreatedDate(LocalDate.now());
        }
        else{
            RevenueExpenditure p = revenueExpenditureRepository.findById(revenueExpenditure.getId()).get();
            revenueExpenditure.setUser(p.getUser());
            revenueExpenditure.setCreatedDate(p.getCreatedDate());
        }
        RevenueExpenditure result = revenueExpenditureRepository.save(revenueExpenditure);
        return new ResponseEntity<>(result, HttpStatus.CREATED);
    }

    @DeleteMapping("/admin/delete")
    public ResponseEntity<?> delete(@RequestParam("id") Long id){
        revenueExpenditureRepository.deleteById(id);
        return new ResponseEntity<>(HttpStatus.OK);
    }

    @GetMapping("/admin/findAll")
    public ResponseEntity<?> findAll(@RequestParam(value = "from",required = false) Date from,
                                     @RequestParam(value = "to",required = false) Date to){
        if(from == null || to == null){
            from = Date.valueOf("2000-01-01");
            to = Date.valueOf("2200-01-01");
        }
        List<RevenueExpenditure> list = revenueExpenditureRepository.findByDate(from, to);
        return new ResponseEntity<>(list,HttpStatus.OK);
    }

    @GetMapping("/admin/findById")
    public ResponseEntity<?> findById(@RequestParam("id") Long id){
        RevenueExpenditure result = revenueExpenditureRepository.findById(id).get();
        return new ResponseEntity<>(result,HttpStatus.OK);
    }
}
