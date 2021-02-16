use std::collections::HashSet;

fn gen_prime(primes: &mut Vec<u64>) {
    let len = primes.len();
    if len == 0 {
        primes.push(2);
        return;
    }
    if len == 1 {
        primes.push(3);
        return;
    }

    let mut num: u64 =  *primes.last().unwrap();
    loop {
        let mut no_prime_flag = 0;
        for p in primes.iter_mut() {
            if num % *p == 0 {
                no_prime_flag = 1;
                break;
            }
        }
        if no_prime_flag == 0 {
            primes.push(num);
            return;
        }
        num += 2;
    }
}

fn get_primes(n: usize) -> Vec<u64> {
    let mut primes: Vec<u64> = Vec::new();
    let mut len_p: usize;
    loop {
        gen_prime(&mut primes);
        len_p = primes.len();
        if len_p >= n {
            break;
        }
    }
    return primes;
}

fn get_twice_squares(n: u64) -> Vec<u64> {
    (1..=n).map(|x| 2*x*x).collect()
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

fn is_odd(n: u64) -> bool {
    if n % 2 == 1 { return true; }
    return false;
}

fn get_odd_composites(n: u64) -> HashSet<u64> {
    (3..=n).filter(|x| !(is_prime(*x)) && is_odd(*x)).collect()
}

fn main() {
    let mut primes: Vec<u64> = get_primes(10_000);
    let mut twice_squares: Vec<u64> = get_twice_squares(100);
    let mut odd_composites: HashSet<u64> = get_odd_composites(10_000);

    let mut product = HashSet::new();
    for p in &primes {
        for t in &twice_squares {
            product.insert(*p + *t);
        }
    }
    let mut answer: u64 = 10_000;
    for x in odd_composites.difference(&product) {
        if *x < answer {
            answer = *x;
        }
    }
    println!("{}", answer);
}
