package com.hotel.service;

import java.util.Date;
import java.util.List;

import com.hotel.model.Booking;
import com.hotel.model.Guest;
import com.hotel.model.Room;

public interface BookingService {
	 void save(Booking booking);
	 List<Booking> findAllOverlapping(Date from,Date to);
}
