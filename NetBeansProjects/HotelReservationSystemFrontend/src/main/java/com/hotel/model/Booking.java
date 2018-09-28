package com.hotel.model;

import java.util.Date;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.validation.Valid;
import javax.validation.constraints.Future;

import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name = "booking")
public class Booking {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
	@Future
	@DateTimeFormat(pattern = "MM-dd-yyyy")
    private Date datefrom;
	@Future
	@DateTimeFormat(pattern = "MM-dd-yyyy")
    private Date dateto;
	private int status;
    @OneToOne(cascade = CascadeType.MERGE)
    @JoinColumn(name = "guest_id")
    private Guest guest;
    @OneToOne(cascade = CascadeType.MERGE)
    @JoinColumn(name = "room_id")
    private Room room;
	public Date getDatefrom() {
		return datefrom;
	}
	public void setDatefrom(Date datefrom) {
		this.datefrom = datefrom;
	}
	public Date getDateto() {
		return dateto;
	}
	public void setDateto(Date dateto) {
		this.dateto = dateto;
	}
	public Guest getGuest() {
		return guest;
	}
	public void setGuest(Guest guest) {
		this.guest = guest;
	}
	public Room getRoom() {
		return room;
	}
	public void setRoom(Room room) {
		this.room = room;
	}
	public Long getId() {
		return id;
	}
	public Booking() {}

	public Booking(Date datefrom, Date dateto, Guest guest, Room room) {
		super();
		this.datefrom = datefrom;
		this.dateto = dateto;
		this.guest = guest;
		this.room = room;
		this.status=0;
	}
  
}
