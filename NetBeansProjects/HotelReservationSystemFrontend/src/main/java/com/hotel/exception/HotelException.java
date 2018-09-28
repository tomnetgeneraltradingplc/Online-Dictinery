/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.hotel.exception;

/**
 *
 * @author TOM
 */

//represent an exception that is thrown when the dates are invalid or the booked room is invalid
public class HotelException extends Exception {	
	private static final long serialVersionUID = -7044312412675275402L;
	private int page;
	public HotelException(String message, int page) {
	        super(message);
	        this.page= page;
	    }
	
	public int getPage() {
		return this.page;
	}
}
