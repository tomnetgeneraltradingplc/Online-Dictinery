package com.hotel.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hotel.model.Guest;
import com.hotel.repository.BookingRepository;
import com.hotel.repository.GuestRepository;
import com.hotel.service.GuestService;
@Service
public class GuestServiceImpl implements GuestService {

    @Autowired
    private GuestRepository repo;

	@Override
	public void save(Guest guest) {
		repo.save(guest);
	}

}
