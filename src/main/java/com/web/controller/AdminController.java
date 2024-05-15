package com.web.controller;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/admin")
public class AdminController {

    @RequestMapping(value = {"/addgiaidau"}, method = RequestMethod.GET)
    public String addgiaidau() {
        return "admin/addgiaidau.html";
    }

    @RequestMapping(value = {"/addtaikhoan"}, method = RequestMethod.GET)
    public String addtaikhoan() {
        return "admin/addtaikhoan.html";
    }

    @RequestMapping(value = {"/addthuchi"}, method = RequestMethod.GET)
    public String addthuchi() {
        return "admin/addthuchi.html";
    }

    @RequestMapping(value = {"/addvandongvien"}, method = RequestMethod.GET)
    public String addvandongvien() {
        return "admin/addvandongvien.html";
    }

    @RequestMapping(value = {"/chuyenmon"}, method = RequestMethod.GET)
    public String chuyenmon() {
        return "admin/chuyenmon.html";
    }

    @RequestMapping(value = {"/giaidau"}, method = RequestMethod.GET)
    public String giaidau() {
        return "admin/giaidau.html";
    }

    @RequestMapping(value = {"/index"}, method = RequestMethod.GET)
    public String index() {
        return "admin/index.html";
    }

    @RequestMapping(value = {"/taikhoan"}, method = RequestMethod.GET)
    public String taikhoan() {
        return "admin/taikhoan.html";
    }

    @RequestMapping(value = {"/thuchi"}, method = RequestMethod.GET)
    public String thuchi() {
        return "admin/thuchi.html";
    }

    @RequestMapping(value = {"/vandongvien"}, method = RequestMethod.GET)
    public String vandongvien() {
        return "admin/vandongvien.html";
    }
}
