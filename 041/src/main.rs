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

fn main() {
    let max_prime = 7654321;
    let prime_numbers = get_prime_vec(max_prime);
    println!("{:?}", prime_numbers);
}