use std::collections::HashSet;

#[derive(Hash, Eq, PartialEq, Clone, Debug)]
enum Digit {
	Dig(u8),
	Any,
}

fn digit_vect( mut number : u64 ) -> Vec<u8> {
	let mut digits = vec![];
	while number != 0 {
		digits.push( (number % 10) as u8 );
		number /= 10;
	}
	digits
}

fn normalised_digits (digits : &Vec<u8>, to_switch:u8) -> Vec<Digit> {
	digits.iter().map(|&d|
			if d == to_switch { Digit::Any }
			else { Digit::Dig(d) }
		).collect()
}

fn parse_digit_vector (digits: Vec<u8>) -> u64 {
	digits.into_iter().rev().fold(0,|sum, digit| sum*10 + digit as u64)
}

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

fn gen_primes(n: u64) -> Vec<u64> {
    let mut primes: Vec<u64> = Vec::new();

    if n < 2 { return primes; }
    if n >= 2 { primes.push(2); }
    let mut i: u64 = 3;
    loop {
        if i > n { break; }
        if is_prime(i) { primes.push(i); }
        i += 2;
    }
    return primes;
}

fn main() {
	let primes = gen_primes(1_000_000);
	let mut already_checked = HashSet::new();
	let n_family = 8;

	'pr: for &prime in &primes { //'
		let prime_digits = digit_vect(prime);
		'd: for digit in (0..10u8).filter(|d| prime_digits.contains(&d)) { //'
			let digits = normalised_digits(&prime_digits, digit);

			let mut nr_replaceables = digits.iter()
				.filter(|&d| *d == Digit::Any)
				.count();

			if nr_replaceables % 3 != 0
			|| digits[0] == Digit::Any
			|| !already_checked.insert(digits.clone())
			{
				continue
			}

			// don't create a leading zero when replacing
			let skip_0 = digits[digits.len()-1] == Digit::Any;
			let mut primes_in_family = 0;

			for new_digit in 0..10u8 {
				if skip_0 && new_digit == 0 { continue }

				let new_digits = digits.iter()
					.map(|d| match d {
							&Digit::Dig(dig) => dig,
							&Digit::Any => new_digit,
					}).collect();

				let new_num = parse_digit_vector(new_digits);
				if is_prime(new_num) { primes_in_family += 1 }
				if 9 - new_digit + primes_in_family < n_family { continue 'd }//'
			}

			if primes_in_family == n_family {
				// success!
				println!("Answer: {}", prime);
				break 'pr;
			}
		}
	}
}