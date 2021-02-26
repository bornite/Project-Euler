fn check_same_digits (n1: u64, n2: u64) -> bool {
	let mut bytes1 = n1.to_string().into_bytes();
	let mut bytes2 = n2.to_string().into_bytes();
	bytes1.sort();
	bytes2.sort();

	if bytes1 != bytes2 {
		return false;
	}
	return true;
}

fn main() {
	let mut num = 1;
	loop {
		num += 1;
		if !check_same_digits(num, 2*num) {continue;}
		if !check_same_digits(num, 3*num) {continue;}
		if !check_same_digits(num, 4*num) {continue;}
		if !check_same_digits(num, 5*num) {continue;}
		if !check_same_digits(num, 6*num) {continue;}
		break;
	}
	println!("{}", num);
}
