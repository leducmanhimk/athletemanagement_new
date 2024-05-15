package com.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class PublicController {

    @RequestMapping(value = {"/forgot"}, method = RequestMethod.GET)
    public String forgot(Model model) {
        return "forgot.html";
    }

    @RequestMapping(value = {"/login","/"}, method = RequestMethod.GET)
    public String login() {
        return "login.html";
    }

}
