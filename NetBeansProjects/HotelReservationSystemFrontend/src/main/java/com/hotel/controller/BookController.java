package com.hotel.controller;

import java.text.DecimalFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.Duration;
import java.time.LocalDate;
import java.time.ZoneId;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.convert.ConversionFailedException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.method.annotation.MethodArgumentTypeMismatchException;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.hotel.exception.HotelException;
import com.hotel.model.Booking;
import com.hotel.model.Guest;
import com.hotel.model.Room;
import com.hotel.service.BookingService;
import com.hotel.service.GuestService;
import com.hotel.service.RoomService;

@Controller
public class BookController {
	
@Autowired
private BookingService bookingService;

@Autowired
private GuestService guestService;

@Autowired
private RoomService roomService;

//Homepage for select date ranges
@RequestMapping(value = "/", method = RequestMethod.GET)
public String reserve(Model model, HttpSession session) {
    return "reserve";
}

//Passed both dates as parameters
//Mapping for rooms fetching and display
@RequestMapping(value = "/rooms", method = RequestMethod.POST)
public String bookform(Model model, @RequestParam(value = "datefrom", required = true) String from,
		@RequestParam(value = "dateto", required = false) String to, HttpSession session,HttpServletRequest request) throws ParseException {	
		Date dateFrom=new SimpleDateFormat("dd-MM-yyyy").parse(from);
		Date dateTo=new SimpleDateFormat("dd-MM-yyyy").parse(to);
		//if date is not bigger than first date
		if(dateFrom.after(dateTo) || dateFrom.equals(dateTo)) throw new ParseException("invalid dates", 0);
		System.out.println("fetching rooms from:"+dateFrom.toString());
		System.out.println("fetching rooms to:"+dateTo.toString());
		// create a list of rooms and send them back to the user interface
	    session.setAttribute("datefrom", dateFrom);
	    session.setAttribute("dateto", dateTo);	
		List<Room> allrooms = roomService.findAll();
		//get all rooms  that are not booked within the provided period
		List<Booking> BookingsInRange= bookingService.findAllOverlapping(dateFrom,dateTo);
		List<Room> non_booked_rooms= roomService.FindFreeRooms(dateFrom, dateTo, BookingsInRange);
		//List<Room> non_booked_rooms=allrooms.stream().filter(r->RoomOverlappingBooking(r, Bookingsafterdate, dateFrom, dateTo)==false).collect(Collectors.toList());
		model.addAttribute("datefrom",new SimpleDateFormat("dd-MM-yyyy").format(dateFrom));
		model.addAttribute("dateto",new SimpleDateFormat("dd-MM-yyyy").format(dateTo));	
		model.addAttribute("available_rooms",non_booked_rooms.size());	
		model.addAttribute("rooms", non_booked_rooms);
		model.addAttribute("path", request.getContextPath());
		//Logging
		System.out.println("bookings after date from:"+BookingsInRange.size());
		System.out.println("all rooms:"+allrooms.size());
		System.out.println("all non booked rooms:"+non_booked_rooms.size());
		return "rooms";
}

//after selecting a room we fetch it and allow the user to fill his information
@RequestMapping(value = "/book/{id}", method = RequestMethod.GET)
public String bookform(Model model, @ModelAttribute("guest") Guest guest, @PathVariable("id") Long room_id,HttpSession session,HttpServletRequest request) throws HotelException {
	// guest and booking will be created here from the domain model
	// fetch the room if it doens't exist return error
	Date dateFrom=(Date) session.getAttribute("datefrom");
	Date dateTo=(Date) session.getAttribute("dateto");
	if(dateFrom ==null ||  dateTo== null || (dateFrom.after(dateTo) || dateFrom.equals(dateTo))) throw new HotelException("invalid dates", 1);
	//fetch room based on id
	Room room= roomService.findById(room_id);
	session.setAttribute("room", room);
	model.addAttribute("datefrom",new SimpleDateFormat("dd-MM-yyyy").format(dateFrom));
	model.addAttribute("dateto",new SimpleDateFormat("dd-MM-yyyy").format(dateTo));	
	model.addAttribute("room",room);
	model.addAttribute("path", request.getContextPath());
	LocalDate datefrom_converted = dateFrom.toInstant().atZone(ZoneId.systemDefault()).toLocalDate();
	LocalDate dateto_converted = dateTo.toInstant().atZone(ZoneId.systemDefault()).toLocalDate();
	// Duration oneDay = Duration.between(today, yesterday); // throws an exception
	Long days_gap=Duration.between(datefrom_converted.atStartOfDay(),dateto_converted.atStartOfDay()).toDays(); // dates diff
	double totalcost=room.getPrice()*days_gap;
	DecimalFormat df = new DecimalFormat("#.##");
	model.addAttribute("totalcost", df.format(totalcost));
	Guest saved_guest= (Guest) session.getAttribute("guest");
	if (saved_guest!=null) model.addAttribute("saved_guest", saved_guest);
	return "confirm";
}

//here a guest is saved and a booking is created and saved too
@RequestMapping(value = "/book/confirm", method = RequestMethod.POST)
public String booking(Model model,@Valid @ModelAttribute("guest") Guest guest, BindingResult result, HttpSession session, RedirectAttributes redAtt,HttpServletRequest request) throws HotelException {
	if(result.hasErrors()) {
		System.out.println("Form has errors....");
		return "confirm";
	}
	Date dateFrom=(Date) session.getAttribute("datefrom");
	Date dateTo=(Date) session.getAttribute("dateto");
	Room room= (Room) session.getAttribute("room");
	if(dateFrom ==null ||  dateTo== null || (dateFrom.after(dateTo) || dateFrom.equals(dateTo))) throw new HotelException("Please Input Valid Dates", 1);	
	if(room==null) throw new HotelException("Room selected is invalid", 2);
	System.out.println("booking Room:"+room.getId());
	System.out.println("booking from:"+dateFrom.toString());
	System.out.println("booking to:"+dateTo.toString());
	guestService.save(guest);
	Booking newbooking = new Booking(dateFrom, dateTo, guest, room);
	bookingService.save(newbooking);
	redAtt.addFlashAttribute("guest", guest);
	redAtt.addFlashAttribute("path", request.getContextPath());
	model.addAttribute("path", request.getContextPath());
	session.setAttribute("guest", guest);
    return "redirect:/success";
}

@RequestMapping(value = "/success", method = RequestMethod.GET)
public String success(Model mode)  {
    return "success";
}

// Specify name of a specific view that will be used to display the error:
@ExceptionHandler(ParseException.class)
public ModelAndView handleError(HttpServletRequest req, Exception ex) {
	ModelAndView mav = new ModelAndView();
	mav.addObject("error", "Please Input Valid Dates");
	mav.setViewName("reserve");
	return mav;
}


//Specify name of a specific view that will be used to display the error:
@ExceptionHandler(HotelException.class) 
public String handlehotelError(HttpServletRequest req, HotelException ex,RedirectAttributes redAtt) {
	redAtt.addFlashAttribute("error", ex.getMessage());
	String viewname= ex.getPage() == 1 ? "reserve" : "rooms";
	return "redirect:/"+viewname;
}
}
