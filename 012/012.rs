use std::collections::HashMap;

// Prime factorize a number and return it as a Hashmap.
// format : {p1: e1, p2: e2, p3: e3},  n = p1^e1 * p2^e2 * p3^e3
fn prime_factorization_of(n: u64) -> HashMap::<u64, u32> {
    let mut x: u64 = n;
    let mut prime_factor = HashMap::<u64, u32>::new();
    for i in 2..x {
        if i * i > x {
            break;
        } else if x % i == 0 {
            x /= i;
            *prime_factor.entry(i).or_insert(0) += 1;
            while x % i == 0 {
                x /= i;
                *prime_factor.entry(i).or_insert(0) += 1;
            }
            if x == 1 {
                return prime_factor;
            }
        }
    }
    *prime_factor.entry(x).or_insert(0) += 1;
    return prime_factor;
}

fn get_num_of_divisors(n: u64) -> u64 {
    let facto: HashMap::<u64, u32>;

    facto = prime_factorization_of(n);
    println!("{:?}", facto);

    let mut prod: u64 = 1;
    for (_base, expo) in facto {
        prod = prod * ((expo as u64)+1);
    }
    return prod;
}

fn main() {
    let mut n: u64;
    let mut triangular_number: u64;
    n = 1;
    loop {
        triangular_number = n*(n+1)/2;
        println!("{}", triangular_number);
        if get_num_of_divisors(triangular_number) > 500 {
            break;
        }
        n += 1;
    }
    println!("{}", triangular_number)
}