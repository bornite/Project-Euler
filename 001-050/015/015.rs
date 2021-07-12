fn combination(n: u64, r: u64) -> u64 {
    match (n, r) {
        (0, _) | (_, 0) => 1,
        _ => combination(n, r - 1) * (n - r + 1) / r
    }
}

fn main() {
    println!("{}", combination(40, 20));    
}