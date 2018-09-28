package com.hotel.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.CrudRepository;

import com.hotel.model.Booking;
import com.hotel.model.Guest;

public interface GuestRepository extends CrudRepository<Guest, Long> {

}
