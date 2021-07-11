fn gen_nth_prime_number(n: usize) -> u64 {
    let mut primes: Vec<u64> = Vec::new();

    if n == 1 {
        return 2;
    }
    primes.push(2);
    let mut p: u64 = 3;
    loop {
        let mut no_prime_flag = 0;
        for i in &primes {
            if p % i == 0 {
                no_prime_flag = 1;
                break;
            }
        }
        if no_prime_flag == 0 {
            primes.push(p);
            println!("{}", primes.len());
        }
        if n == primes.len() {
            return p;
        }
        p += 2;
    }
}

fn main() {
    let mut n: usize = 6;
    println!("{}", gen_nth_prime_number(n));
    n = 10001;
    println!("{}", gen_nth_prime_number(n));
}
