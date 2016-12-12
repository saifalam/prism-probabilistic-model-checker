// Model3: divide and distribute 3⁄4 coding disks with repairs
// Annual Failure rate 5%
// T=1 ( year)
// Annual repair rate rr = 1w (52,142857143) OR 1d (365) OR 1h (8760)
//====================== Results ============================
// Results: 99.94395322369579 (one week) OR 99.99181150494746 (one day) OR 99.99965758760626 (one hour)

ctmc //current time Markov chain

const double fr = 0.05; // Annual Failure rate 5%
const int dsk = 4;      //number of disks for distributesd 3/4 coding
const double rr;

module disk
        // 2 (4 disk are up) 1 (3 disk are up) durable ,0 failed
	ss:[0..2] init 2;

	[fail1] (ss=2) -> dsk*fr:(ss'= ss-1);
	[fail2] (ss=1) -> (dsk-1)*fr:(ss'= ss-1);

	// repair only when at least 3 is up
	[repair] (ss=1) -> ss*rr : (ss'= ss+1);
endmodule
