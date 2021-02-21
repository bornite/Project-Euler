extern crate permutohedron;
use permutohedron::LexicalPermutation;

fn is_prime(n: u64) -> bool {
    match n {
        0 => false,
        1 => false,
        2 => true,
        3 => true,
        n if n % 2 == 0 => false,
        n if n % 3 == 0 => false,
        _ => {
            let sqrt = (n as f64).sqrt() as u64;
            let mut base = 6;
            while base <= sqrt {
                if n % (base - 1) == 0 {
                    return false;
                }
                if n % (base + 1) == 0 {
                    return false;
                }
                base += 6;
            }
            true
        }
    }
}

fn gen_primes(n: u64) -> Vec<u64> {
    let mut primes: Vec<u64> = Vec::new();

    if n > 2 { primes.push(2); }
    let mut i: u64 = 3;
    loop {
        if i > n { break; }
        if is_prime(i) { primes.push(i); }
        i += 2;
    }
    return primes;
}

fn permutations(mut digits: Vec<u64>) -> impl Iterator<Item = Vec<u64>> {
	let mut finished = false;
	std::iter::repeat(())
		.scan((), move |(), ()| {
			let next = digits.clone();
			match (digits.next_permutation(), finished) {
				(true, _) => Some(next),
				(false, false) => {
					finished = true;
					Some(next)
				}
				(false, true) => None,
			}
		})
}

fn main() {
	let primes = gen_primes(10_000);
    let mut prime_perm_seq = vec![];
	for &prime in primes.iter() {
		if prime < 1000 { continue };

		// parse digits
		let mut digits : Vec<u64> = vec![];
		for ch in prime.to_string().chars().rev() {
			digits.push( ch.to_digit(10).unwrap() as _)
		}

		// permute digits and find primes
		// write into vector
		let mut prime_perm_seq_temp = vec![];
		for perm in permutations(digits) {
			let mut num = 0;
			for (i,&digit) in perm.iter().enumerate() {
				num += digit * 10u64.pow(i as _)
			}
			if num < 1000 { break };
			if is_prime(num) { prime_perm_seq_temp.push(num) }
		}

		// sort and deduplicate
		// no clue how those duplicates even come in
		// but they do and this kills them
		prime_perm_seq_temp.sort();
		prime_perm_seq_temp.dedup();

		// find sequence of constant difference between term
		let mut reduced_seq = vec![];
		'i:for i in 0..prime_perm_seq_temp.len() {
			for j in i+1..prime_perm_seq_temp.len() {
				let per_prime1 = prime_perm_seq_temp[i];
				let per_prime2 = prime_perm_seq_temp[j];
				reduced_seq.push(per_prime1);
				reduced_seq.push(per_prime2);

				for &per_prime3 in prime_perm_seq_temp.iter() {
					if per_prime3 + per_prime1 == 2 * per_prime2 {
						reduced_seq.push(per_prime3);
						break 'i;
					}
				}
				reduced_seq.drain(..);
			}
		}

		if reduced_seq.len() == 3 && !prime_perm_seq.contains(&reduced_seq) {
			prime_perm_seq.push(reduced_seq)
		}
		if prime_perm_seq.len() == 2 { break }; // all sequences found
	}
	for seq in prime_perm_seq {
		println!("{:?} => {}{}{}", seq, seq[0], seq[1], seq[2]);
	}
}