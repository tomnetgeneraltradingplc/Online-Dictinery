package com.hotel.service.impl;

import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;

import org.jboss.logging.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Service;

import com.hotel.model.Booking;
import com.hotel.model.Room;
import com.hotel.repository.RoomRepository;
import com.hotel.service.RoomService;
@Service
public class RoomServiceImpl implements RoomService {
	
	@Autowired
	RoomRepository repo;

	@Override
	public List<Room> findAll() {
		return (List<Room>) repo.findAll();
	}

	@Override
	public Room findById(Long id) {
		return repo.findById(id);
	}
	
	@Override
	public List<Room> FindFreeRooms(Date from, Date to, List<Booking> BookingsInRange) {
		List<Room> allrooms = findAll();
		//get all rooms  that are not booked within the provided period
		List<Room> non_booked_rooms=allrooms.stream().filter(r->RoomOverlappingBooking(r, BookingsInRange, from, to)==false).collect(Collectors.toList());
		return non_booked_rooms;
	}
	

	// returns true if two dates overlap
	private boolean overlap(Date start1, Date end1, Date start2, Date end2){
	    return start1.getTime() <= end2.getTime() && start2.getTime() <= end1.getTime(); 
	}

	//returns whether a room overlaps a booked within the specified dates
	private boolean RoomOverlappingBooking(Room room,List<Booking> bookings,Date start, Date end) {
		for(Booking booking: bookings) {
			if(overlap(booking.getDatefrom(),booking.getDateto(),start,end) && booking.getRoom().equals(room)) {
				System.out.println("overlapped");
				return true;
			}
		}
		return false;
	}



}
