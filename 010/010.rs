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
    return;
}

fn main() {
    let mut primes: Vec<u64> = Vec::new();
    let mut last_p: u64;
    let mut sum: u64 = 0;

    while true {
        gen_prime(&mut primes);
        last_p = *primes.last().unwrap();
        if last_p <= 2000000 {
            println!("{}", last_p);
            sum = sum + last_p;
        } else {
            println!("{}", last_p);
            break;
        }
    }
    println!("{}", sum);
}