struct Fibonacci {
    cur: i64,
    next: i64,
}

impl Fibonacci {
    // Initialize.
    fn new() -> Fibonacci {
        Fibonacci { cur: 0, next: 1 }
    }
}

impl Iterator for Fibonacci {
    type Item = i64;
    // Calculate the next term based on the information in cur and next.
    fn next(&mut self) -> Option<i64> {
        let x = self.cur;
        self.cur = self.next;
        self.next += x;
        println!("{}", self.cur);
        Some(x)
    }
}

fn sum_of_even_fibonacci_seq(limit: i64) -> i64 {
    let s: i64 = Fibonacci::new()
        // filter by even.
        .filter(|&f| f % 2 == 0)
        // filter under limit.
        .take_while(|&f| f <= limit)
        .sum();
    return s;
}

fn main() {
    let n: i64 = 4000000;
    let s: i64 = sum_of_even_fibonacci_seq(n);
    println!("{}", s);
}
