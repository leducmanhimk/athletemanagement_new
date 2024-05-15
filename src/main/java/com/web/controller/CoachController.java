package com.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/huanluyenvien")
public class CoachController {

    @RequestMapping(value = {"/addbaitap"}, method = RequestMethod.GET)
    public String addbaitap() {
        return "huanluyenvien/addbaitap.html";
    }

    @RequestMapping(value = {"/addlichtap"}, method = RequestMethod.GET)
    public String addlichtap() {
        return "huanluyenvien/addlichtap.html";
    }

    @RequestMapping(value = {"/baitap"}, method = RequestMethod.GET)
    public String baitap() {
        return "huanluyenvien/baitap.html";
    }

    @RequestMapping(value = {"/feedback"}, method = RequestMethod.GET)
    public String feedback() {
        return "huanluyenvien/feedback.html";
    }

    @RequestMapping(value = {"/giaidau"}, method = RequestMethod.GET)
    public String giaidau() {
        return "huanluyenvien/giaidau.html";
    }

    @RequestMapping(value = {"/hoso"}, method = RequestMethod.GET)
    public String hoso() {
        return "huanluyenvien/hoso.html";
    }

    @RequestMapping(value = {"/lichtap"}, method = RequestMethod.GET)
    public String lichtap() {
        return "huanluyenvien/lichtap.html";
    }

    @RequestMapping(value = {"/lichtapvdv"}, method = RequestMethod.GET)
    public String lichtapvdv() {
        return "huanluyenvien/lichtapvdv.html";
    }

    @RequestMapping(value = {"/vandongvien"}, method = RequestMethod.GET)
    public String vandongvien() {
        return "huanluyenvien/vandongvien.html";
    }
}
