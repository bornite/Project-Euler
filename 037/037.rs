pub fn is_prime(n: u64) -> bool {
    match n {
        0 => false,
        1 => false,
        2 => true,
        3 => true,
        n if n % 2 == 0 => false,
        n if n % 3 == 0 => false,
        _ => {
            let sqrt = (n as f32).sqrt() as u64;
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

fn add_right(v: &Vec<u64>) -> Vec<u64> {
    let digits: [u64; 4] = [1, 3, 7, 9];
    let mut w = Vec::new();
    for branch in v {
        for d in digits.iter() {
            let candidate = branch * 10 + d;
            if is_prime(candidate) {
                w.push(candidate)
            }
        }
    }
    return w;
}

fn left_truncate(n: u64) -> u64 {
    let zeroes = (n as f32).log(10f32) as u32;
    n % 10u64.pow(zeroes)
}

fn left_truncatable(n: u64) -> bool {
    // Assumes that the number has already been tested to be prime itself.
    let mut nc = left_truncate(n);
    while nc > 0 {
        if !is_prime(nc) {
            return false;
        }
        nc = left_truncate(nc)
    }
    return true;
}

pub fn main() {
    // Strategy: generate right-truncatable primes by adding digits to the right side of primes and
    // seeing if the result is a prime.
    // Test each right-truncatable prime to see if it is also left-truncatable.
    // If it is, add it to the sum.
    let mut sum = 0;
    let mut branches: Vec<u64> = vec![2, 3, 5, 7];
    branches = add_right(&branches);
    while branches.len() > 0 {
        for b in &branches {
            if left_truncatable(*b) {
                sum += *b;
		println!("{}", *b);
            }
        }
        branches = add_right(&branches);
    }
    println!("{}", sum);
}
