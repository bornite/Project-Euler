fn is_prime(n: u64) -> bool {
    if n <= 1 {
        return false;
    }
    let max = ((n as f64).sqrt() as u64) + 1;
    for d in 2..max {
        if n % d == 0 {
            return false;
        }
    }
    return true;
}

fn is_circular_prime(prime:u64) -> bool {
    let mut digits : Vec<u64> = vec![];
    if prime == 2 || prime == 5 {
        return true;
    }

	for ch in prime.to_string().chars().rev() {
		digits.push( ch.to_digit(10).unwrap() as _ )
	}

	for rotation in digits.iter().cycle().take(2*digits.len() - 1).collect::<Vec<&u64>>().windows( digits.len() ) {
		let mut num = 0;
		for (i,&digit) in rotation.iter().enumerate() {
			if digit % 2 == 0 || digit % 5 == 0 { return false } // slight optimisation
			num += digit * 10u64.pow(i as u32);
		}

		if !is_prime(num) { return false }
	}
	return true;
}

fn get_circular_primes(limit: u64) -> Vec<u64> {
    let mut circular_primes: Vec<u64> = Vec::new();

    for i in (2u64..=limit) {
        if is_prime(i) {
            if is_circular_prime(i) {
                println!("{}", i);
                circular_primes.push(i);
            }
        }
    } 
    return circular_primes;
}

fn main() {
    let limit: u64 = 1_000_000;
    let circular_primes = get_circular_primes(limit);
    println!("{:?}", circular_primes);
    println!("{}", circular_primes.len());
}