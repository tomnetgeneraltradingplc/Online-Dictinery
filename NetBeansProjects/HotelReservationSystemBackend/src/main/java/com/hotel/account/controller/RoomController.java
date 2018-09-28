package com.hotel.account.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.hotel.account.model.User;

@Controller
public class RoomController {
	
	
	
    @RequestMapping(value = {"/rooms"}, method = RequestMethod.GET)
    public String rooms(Model model) {
        return "rooms";
    }
    @RequestMapping(value = {"/reports"}, method = RequestMethod.GET)
    public String reports(Model model) {
    	
        return "reports";
    }
    @RequestMapping(value = {"/reservations"}, method = RequestMethod.GET)
    public String reservations(Model model) {
        return "reservations";
    }
    @RequestMapping(value = {"/roomregistration"}, method = RequestMethod.GET)
    public String roomregistration(Model model) {
    	model.addAttribute("roomForm", new User());
        return "roomregistration";
    }
}
