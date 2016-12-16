// Model5: 
// ===============================================
// Task:  Model 3/4 coding for data centers each with 17/20 coding
// what is the probability that the data will be durable -> failedDC<=1
// ===============================================
// DC failure rate = 0.01%
// Disk failure rate = 5%
// Time frame T =1 year
// Annual repair rate rr = 1w (52,142857143) OR 1d (365) OR 1h (8760)
// Repair rates (disks, DC) : 1 week, 1 day (all combinations)
//====================== Results ============================


ctmc


const double DCfr = 0.0001; 	// Data Center Failure rate
const double DCrr; 		// Data Center Repair rate

const double Dfr = 0.05;    	// Disk Failure rate
const double Drr;		// Disk Repair rate


module assignment

	ss:[0..2] init 2;  	// Data Centers
	ss1:[0..4] init 4; 	// Disks


	[fail1] (ss = 2 & ss1 = 4) -> 20*Dfr:(ss1'= ss1-1) + 4*DCfr:(ss'= ss-1);
	[fail2] (ss = 2 & ss1 = 3) -> 19*Dfr:(ss1'= ss1-1) + 4*DCfr:(ss'= ss-1);
	[fail3] (ss = 2 & ss1 = 2) -> 18*Dfr:(ss1'= ss1-1) + 4*DCfr:(ss'= ss-1);
	[fail4] (ss = 2 & ss1 = 1) -> 4*DCfr:(ss'= ss-1);


	[fail5] (ss = 1 & ss1 = 4) -> 20*Dfr:(ss1'= ss1-1) + 3*DCfr: (ss'= ss-1);
	[fail6] (ss = 1 & ss1 = 3) -> 19*Dfr:(ss1'= ss1-1) + 3*DCfr: (ss'= ss-1);
	[fail7] (ss = 1 & ss1 = 2) -> 18*Dfr:(ss1'= ss1-1) + 3*DCfr: (ss'= ss-1);
	[fail8] (ss = 1 & ss1 = 1) -> 3*DCfr: (ss'= ss-1);

	
	[repair1] (ss = 2 & ss1 = 3) -> 1*Drr : (ss1'= ss1+1);
	[repair2] (ss = 2 & ss1 = 2) -> 2*Drr : (ss1'= ss1+1);
	[repair3] (ss = 2 & ss1 = 1) -> 3*Drr : (ss1'= ss1+1);

	[repair4] (ss = 1 & ss1 = 4) -> 1*DCrr : (ss'= ss+1);

	[repair5] (ss = 1 & ss1 = 3) -> 1*Drr : (ss1'= ss1+1) + 1*DCrr : (ss'= ss+1);
	[repair6] (ss = 1 & ss1 = 2) -> 2*Drr : (ss1'= ss1+1) + 1*DCrr : (ss'= ss+1);
	[repair7] (ss = 1 & ss1 = 1) -> 3*Drr : (ss1'= ss1+1) + 1*DCrr : (ss'= ss+1);
	

endmodule