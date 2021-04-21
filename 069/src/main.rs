fn is_prime(n: u64) -> bool {
    match n {
        0 => false,
        1 => false,
        2 => true,
        3 => true,
        n if n % 2 == 0 => false,
        _ => {
            let sqrt = (n as f64).sqrt() as u64;
            let mut base = 3;
            while base <= sqrt {
                if n % base == 0 {
                    return false;
                }
                base += 2;
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

fn compute(limit: u64) -> u64 {
    let primes = gen_primes(1_000_000);
    let mut n = 1;
    for p in &primes {
        if n * p > limit {
            break;
        }
        n *= p
    }
    n
}

fn main() {
    println!("{}", compute(1000000).to_string());
}