use std::collections::HashMap;
use std::cmp::max;

// Prime factorize a number and return it as a Hashmap.
// format : {p1: e1, p2: e2, p3: e3},  n = p1^e1 * p2^e2 * p3^e3
fn prime_factorization_of(n: i64) -> HashMap::<i64, u32> {
    let mut x: i64 = n;
    let mut prime_factor = HashMap::<i64, u32>::new();
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

fn hash_of_least_common_multiple(n: i64) -> HashMap::<i64, u32> {
    let mut result = HashMap::<i64, u32>::new();
    // Merge the results of prime factorization from 1 to n
    // For each prime factor, we choose the one with the largest exponent.
    for i in 2..n+1 {
       let h: HashMap::<i64, u32> = prime_factorization_of(i);
       println!("{:?}", h);
       for (k, v) in h {
          *result.entry(k).or_insert(0) = max(*result.entry(k).or_insert(0), v);
       }
    }
    return result;
}

fn compute_lcm_from_hash(hash_of_prime_division: HashMap::<i64, u32>) -> i64 {
    // Create LCM by multiplying each prime factor and exponent
    let mut answer: i64  = 1;
    for (p, e) in hash_of_prime_division {
        answer = answer * (p.pow(e));
    }
    return answer;
}

fn main() {
    let n: i64 = 20;
    let h: HashMap::<i64, u32> = hash_of_least_common_multiple(n);
    println!("{:?}", h);
    println!("{}", compute_lcm_from_hash(h))
}

