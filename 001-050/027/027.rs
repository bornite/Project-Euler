fn is_prime(n: i64) -> bool {
    if n <= 1 {
        return false;
    }
    let max = ((n as f64).sqrt() as i64) + 1;
    for d in 2..max {
        if n % d == 0 {
            return false;
        }
    }
    return true;
}

fn polynomial(a: i64, b: i64, n: i64) -> i64 {
    return n * n + a * n + b;
}

fn main() {
    let mut best = (0, 0);
    let mut best_count = 0;
/*    let bs = (0..1000).filter(|&b| is_prime(b)).collect::<Vec<_>>();*/
    for a in -999..1000 {
        for b in -999..1000 {
            let count = (0..)
                .take_while(|n| is_prime(polynomial(a,b,*n)))
                .map(|_| 1)
                .sum::<i64>();
            if count > best_count {
                best = (a, b);
                best_count = count;
            }
        }
    }
    println!("a = {}, b = {}, a*b = {}, best_count = {}", best.0, best.1, best.0 * best.1, best_count)
}