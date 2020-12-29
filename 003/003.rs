fn main() {
    println!("{}", largest_prime_factor_of(600851475143));
}

fn largest_prime_factor_of(m: i64) -> i64 {
    let mut n: i64 = m;
    for i in 2..n {
        if i * i > n {
            break;
        } else if n % i == 0 {
            n /= i;
            while n % i == 0 {
                n /= i;
            }
            if n == 1 {
                return i;
            }
        }
    }
    return n;
}
