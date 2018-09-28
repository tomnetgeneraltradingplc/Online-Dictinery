package com.hotel.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import com.hotel.model.Booking;
import com.hotel.model.Room;

public interface RoomRepository extends CrudRepository<Room, Long> {
	@Query("SELECT r FROM Room r WHERE r.id = ?1")
	public Room findById(Long id);
}
