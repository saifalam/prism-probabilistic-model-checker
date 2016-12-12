// Model1 one disk without repairs
// Annual Failure rate 5%
// T=1 ( year)
//====================== Result ============================
// result: 95.12294272563595

ctmc //current time Markov chain

const double fr = 0.05;     // Annual Failure rate 5%

module disk
         ss: [0..1] init 1; // durable 1 , 0 failed
	[fail] (ss=1) -> fr : (ss'=0);
endmodule
