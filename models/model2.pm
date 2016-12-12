// Model2: replication two disks with repairs
// Annual Failure rate 5%
// T=1 ( year)
// Annual repair rate rr = 1w (52,142857143) OR 1d (365) OR 1h (8760)
//====================== Results ============================
// Results: 99.99062173456771 (one week) OR 99.9986344590424 (one day) OR 99.99994292988353 (one hour)

ctmc //current time Markov chain

const double fr = 0.05; // Annual Failure rate 5%
const int d = 2; // number of disks
const double rr; // put the value when run the program like 365 OR 8760 etc

module disk
        ss: [0..d] init d; // durable d>0 , 0 failed
	[fail] (ss>0) -> ss*fr : (ss'= ss-1);

	// repair only when the at least one disk is still up
	[repair] (ss<d) & (ss>0) -> (d-ss)*rr : (ss'=ss+1);
endmodule