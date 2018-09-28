$( document ).ready(function() {
	
	var dateoptions1= {
		    minDate: new Date().fp_incr(1),
			dateFormat: "d-m-Y"
	};
	
	var dateoptions2= {
		    minDate: new Date().fp_incr(2),
			dateFormat: "d-m-Y"
	};
	
	$("#datefrom").flatpickr(dateoptions1);
	$("#dateto").flatpickr(dateoptions2);

});

