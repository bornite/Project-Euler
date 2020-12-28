use std::env;

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

fn main() {
    let args: Vec<String> = env::args().collect();
    let n: i64 = args[1].parse().unwrap();
    let s: i64 = Fibonacci::new()
        // filter by even.
        .filter(|&f| f % 2 == 0)
        // filter under limit n.
        .take_while(|&f| f <= n)
        .sum();
    println!("{}", s);
}
