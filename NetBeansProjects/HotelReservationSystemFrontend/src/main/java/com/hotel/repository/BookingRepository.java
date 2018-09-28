package com.hotel.repository;

import java.util.Date;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import com.hotel.model.Booking;


public interface BookingRepository extends CrudRepository<Booking, Long> {
	@Query("SELECT b FROM Booking b WHERE b.datefrom <= ?2 and b.dateto >= ?1 ")
	List<Booking> findAllOverlapping(Date from, Date to);
}
