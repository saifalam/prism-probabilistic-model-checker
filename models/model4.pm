// Model4: divide and distribute 17/20 coding disks with repairs
// Annual Failure rate 5%
// T=1 ( year)
// Annual repair rate rr = 1w (52,142857143) OR 1d (365) OR 1h (8760)
// DC annual Failure rate 0.01%
//====================== Results ============================
// Results:without DC annual Failure rate => 99.99991955783759 (one week) OR 99.99999975303086 (one day) OR 99.999999999982 (one hour)
// Results:with DC annual Failure rate => 99.9899200665417 (one week) OR 99.9900002530389 (one day) OR 99.99000049996532 (one hour)

ctmc //current time Markov chain

const double fr = 0.05;
const double failedDC = 0.0001;  // DC annual Failure rate 0.01%
const int disk = 20;             //number of disks
const double rr ;                // put the value when run the program like 365 OR 8760 etc


module SeventeenTwenty
	ss:[0..4] init 4;

	[fail1] (ss=4) -> disk*fr:(ss'= ss-1);
	[fail2] (ss=3) -> (disk-1)*fr:(ss'= ss-1);
	[fail3] (ss=2) -> (disk-2)*fr:(ss'= ss-1);
	[fail4] (ss=1) -> (disk-3)*fr:(ss'= ss-1);

	[repair] (ss=3) -> 1*rr : (ss'= ss+1);
	[repair] (ss=2) -> 2*rr : (ss'= ss+1);
	[repair] (ss=1) -> 3*rr : (ss'= ss+1);

	// for DC annual Failure rate
	// comment it to get the results for without DC annual Failure rate
	[fail5] (ss>0) -> failedDC: (ss'= 0);
endmodule
