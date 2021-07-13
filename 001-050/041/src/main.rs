fn is_prime(n: u64) -> bool {
    if n <= 1 {
        return false;
    }
    let max = ((n as f64).sqrt() as u64) + 1;
    for d in 2u64..max {
        if n % d == 0 {
            return false;
        }
    }
    return true;
}

fn get_prime_vec(max_prime: u64) -> Vec<u64> {
    let mut ret = Vec::new();
    for n in 1..=max_prime {
        if is_prime(n) {
            ret.push(n)
        }
    }
    return ret;
}

fn find_biggest_pandigital_prime(prime_numbers:&[u64]) -> Option<u64> {
	'primes : for &prime in prime_numbers.iter().rev() {
		let mut digits_found = [false;9];
		let prime_string : String = prime.to_string();
		for ch in prime_string.chars() {
			let digit:u32 = ch.to_digit(10).unwrap();
			if digit == 0 {
                continue 'primes
            };
			if !digits_found[(digit-1) as usize] {
				digits_found[(digit-1) as usize] = true;
			}
			else {
                continue 'primes;
            }
		}

		for (n,&digit_present) in digits_found.iter().enumerate() {
			if !digit_present { continue 'primes }; // failed
			if n+1 == prime_string.len() { break }; // passed
		}
		return Some(prime);
	}
	return None;
}

fn main() {
    /*
    1 + 2 + ... + 9 = 45 (dividable by 9 => 9-pandigimal number is dividable by 9)
    1 + 2 + ... + 8 = 36 (dividable by 9 => 8-pandigimal number is dividable by 9)
    7-pandigimal is the largest pandigimal prime.
    */
    let max_prime = 7654321;
    let prime_numbers = get_prime_vec(max_prime);
    if let Some(biggest_pandigital_prime) = find_biggest_pandigital_prime(&prime_numbers) {
		println!("{}", biggest_pandigital_prime);
	}
}