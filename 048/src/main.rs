fn main() {
	let mut last_digits : u64 = 0;
	let lower_than : u64 = 10_000_000_000;
	for i in 1..=1000 {
		let mut temp : u64 = i;
		for j in 1..i {
			if j % 2 == 0 { temp = temp % lower_than; } // last 10 digits
			temp *= i;
		}
		last_digits += temp % lower_than;
	}
	last_digits = last_digits % lower_than;
	println!("{}", last_digits);
}