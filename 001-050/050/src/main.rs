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
    let n: u64 = 1_000_000;
	let primes = gen_primes(n);
    let beginning_primes = gen_primes(10);

	let mut max_seq_len = 0;
    let mut sum_of_longguest_seq: u64 = 0;

    for (i,&_prime) in beginning_primes.iter().enumerate() {
        let mut j = i;
        loop {
            j += 1;
            let iter1 = (&primes[i..j]).iter();
            let sum: u64 = iter1.fold(0, |sum, p| sum + p);
            if is_prime(sum) && ((j - i) > max_seq_len)  {
                if sum > n {
                    break;
                }
                sum_of_longguest_seq = sum;
                max_seq_len = j - i;
            }
        }
    }
    println!("prime: {}, sequence length: {}", sum_of_longguest_seq, max_seq_len);
}