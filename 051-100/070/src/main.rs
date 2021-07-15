/// Calculate prime numbers up to given upper bound
/// Sieve of Erasthothenes
fn primes_up_to(max_prime: usize) -> Vec<u64> {
    let mut is_prime = vec![true; max_prime+1];
    is_prime[0]=false;
    is_prime[1]=false;
    let mut prime_numbers = vec![];

    for number in 0..is_prime.len() {
            if is_prime[number] {
                    prime_numbers.push(number as u64);
                    for i in (2*number..max_prime).step_by(number) { is_prime[i] = false }
            }
            // if number % 1000000 == 0 { println!("{}", number) };
    }
    prime_numbers
}

fn prime_factors( mut to_factorise : u64, primes : &[u64] ) -> Vec<[u64;2]> {
	let mut factors = vec![];
	for &prime in primes {
		if prime*prime > to_factorise {
			factors.push([to_factorise, 1]);
			break
		}
		let mut occurences = 0;
		while to_factorise % prime == 0 {
			to_factorise /= prime;
			occurences += 1;
		}
		if occurences > 0 { factors.push([prime, occurences]) }
		if to_factorise == 1 { break }
	}
	factors
}

fn phi(n: u64, factors: Vec<[u64;2]>) -> u64 {
    n * factors.iter().fold(1, |prod, &[p,_]| (p-1)*prod )
    / factors.iter().fold(1, |prod, &[p,_]| p*prod )
}

fn are_permutations(mut n1: u64, mut n2: u64) -> bool {
    let (mut digs1, mut digs2) = ([0;10], [0;10]);
    while n1 != 0 {
        digs1[(n1 % 10) as usize] += 1;
        n1 /= 10;
    }
    while n2 != 0 {
        digs2[(n2 % 10) as usize] += 1;
        n2 /= 10;
    }
    digs1 == digs2
}

fn main() {
    let max : u64 = 10_000_000;
    let primes = primes_up_to((max) as usize);
    let mut min_ratio = 2f64;
    let mut min_ratio_pos = 0;

    for i in (2..max).rev() {
        let factors = prime_factors(i, &primes);
        let phi_i = phi(i, factors);
        if !are_permutations(i, phi_i) { continue }
        let ratio = i as f64 / phi_i as f64;
        if ratio < min_ratio {
            min_ratio = ratio;
            min_ratio_pos = i;
            println!("n = {}, ϕ(n) = {} => {}", i, phi_i, ratio);
        }
    }
    println!("{}", min_ratio_pos);
}