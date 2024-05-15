package com.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/chuyengia")
public class ExpertController {

    @RequestMapping(value = {"/addlichkham"}, method = RequestMethod.GET)
    public String addlichkham() {
        return "chuyengia/addlichkham.html";
    }

    @RequestMapping(value = {"/addtranthuong"}, method = RequestMethod.GET)
    public String addtranthuong() {
        return "chuyengia/addtranthuong.html";
    }

    @RequestMapping(value = {"/lichkham"}, method = RequestMethod.GET)
    public String lichkham() {
        return "chuyengia/lichkham.html";
    }

    @RequestMapping(value = {"/tranthuong"}, method = RequestMethod.GET)
    public String tranthuong() {
        return "chuyengia/tranthuong.html";
    }

    @RequestMapping(value = {"/updatevdv"}, method = RequestMethod.GET)
    public String updatevdv() {
        return "chuyengia/updatevdv.html";
    }

    @RequestMapping(value = {"/vandongvien"}, method = RequestMethod.GET)
    public String vandongvien() {
        return "chuyengia/vandongvien.html";
    }


}
