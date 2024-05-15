package com.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
@Controller
@RequestMapping("/vandongvien")
public class AthleteController {

    @RequestMapping(value = {"/giaidau"}, method = RequestMethod.GET)
    public String giaidau() {
        return "vandongvien/giaidau.html";
    }

    @RequestMapping(value = {"/hoso"}, method = RequestMethod.GET)
    public String hoso() {
        return "vandongvien/hoso.html";
    }

    @RequestMapping(value = {"/lichtapvdv"}, method = RequestMethod.GET)
    public String lichtapvdv() {
        return "vandongvien/lichtapvdv.html";
    }

}
