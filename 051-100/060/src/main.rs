use std::collections::{HashMap, HashSet};
use std::cmp::min;

fn length(mut num: u64) -> u32 {
    let mut len = 0;
    while num != 0 {
        len += 1;
        num /= 10;
    }
    len as u32
}

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
    let primes = get_prime_vec(30_000);
    let mut concatenable = HashMap::new();
    concatenable.reserve(100000);

    for (i,&prime1) in primes.iter().enumerate() {
        let mut concats = HashSet::new();
        for (j, &prime2) in primes.iter().enumerate() {
            if i % 100 == 0 && j % 10_000 == 0 { println!("{:?}", (i,j)) };

            let concat_num = prime1 * 10u64.pow( length(prime2) ) + prime2;
            if is_prime(concat_num) {
                concats.insert(prime2);
            }
        }
        concatenable.insert(prime1, concats);
    }

    let mut min_sum = !0;

    let empty = HashSet::new();
    let extract_set = |prime : u64| {
        if let Some(set) = concatenable.get(&prime) { set } else { &empty }
    };

    for &prime1 in primes.iter() {
        // primes that can be concatenated with prime1
        let primes1 = extract_set(prime1);
        //println!("primes2");
        for &prime2 in primes1.iter() {
            let primes2 = extract_set(prime2);
            if !primes2.contains(&prime1) { continue }
            //println!("primes3");
            for &prime3 in primes2.iter() {
                let primes3 = extract_set(prime3);
                if !primes3.contains(&prime1) || !primes3.contains(&prime2)
                || !primes1.contains(&prime3) {
                    continue
                }
                //println!("primes4");
                for &prime4 in primes3.iter() {
                    let primes4 = extract_set(prime4);
                    if !primes4.contains(&prime1) || ! primes4.contains(&prime2)
                    || !primes4.contains(&prime3)
                    || !primes2.contains(&prime4)
                    || !primes1.contains(&prime4) {
                        continue
                    }
                    //println!("primes5");
                    for &prime5 in primes4.iter() {
                        let primes5 = extract_set(prime5);
                        if !primes5.contains(&prime1) || !primes5.contains(&prime2)
                        || !primes5.contains(&prime3) || !primes5.contains(&prime4)
                        || !primes1.contains(&prime5)
                        || !primes2.contains(&prime5)
                        || !primes3.contains(&prime5) {
                            continue
                        }
                        let sum = prime1+prime2+prime3+prime4+prime5;
                        min_sum = min(sum, min_sum);
                        //println!("{}", sum);

                    }
                }
            }
        }
    }

    println!("{}", min_sum);
}
