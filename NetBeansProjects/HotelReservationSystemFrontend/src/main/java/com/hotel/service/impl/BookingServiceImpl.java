package com.hotel.service.impl;

import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hotel.model.Booking;
import com.hotel.model.Room;
import com.hotel.repository.BookingRepository;
import com.hotel.repository.RoomRepository;
import com.hotel.service.BookingService;
@Service
public class BookingServiceImpl implements BookingService
{
    @Autowired
    private BookingRepository repo;
       
	@Override
	public void save(Booking booking) 
	{
		repo.save(booking);		
	}
	
	@Override
	public List<Booking> findAllOverlapping(Date from,Date to) 
	{
		return repo.findAllOverlapping(from, to);
	}
}
