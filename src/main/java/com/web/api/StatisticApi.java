package com.web.api;

import com.web.dto.RevenueType;
import com.web.repository.RevenueExpenditureRepository;
import com.web.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;

@RestController
@RequestMapping("/api/statistic")
@CrossOrigin
public class StatisticApi {

    @Autowired
    private RevenueExpenditureRepository revenueExpenditureRepository;

    @Autowired
    private UserRepository userRepository;

    @GetMapping("/admin/revenue-year")
    public List<Double> doanhThu(@RequestParam("year") Integer year, @RequestParam RevenueType revenueType){
        List<Double> list = new ArrayList<>();
        for(int i=1; i< 13; i++){
            Double sum = revenueExpenditureRepository.calDt(i, year, revenueType);
            if(sum == null){
                sum = 0D;
            }
            list.add(sum);
        }
        return list;
    }

    @GetMapping("/admin/tongTk")
    public ResponseEntity<?> tongTk(@RequestParam(value = "role", required = false) String role){
        Long tong = 0L;
        if(role == null){
            tong = userRepository.count();
        }
        else{
            tong = userRepository.tongUserByRole(role);
        }
        return new ResponseEntity<>(tong, HttpStatus.OK);
    }
}
