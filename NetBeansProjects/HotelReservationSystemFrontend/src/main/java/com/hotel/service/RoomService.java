package com.hotel.service;

import java.util.Date;
import java.util.List;

import com.hotel.model.Booking;
import com.hotel.model.Guest;
import com.hotel.model.Room;

public interface RoomService {
    List<Room> findAll();
    Room findById(Long id);
	List<Room> FindFreeRooms(Date from, Date to, List<Booking> BookingsInRange);
}
