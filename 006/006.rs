fn sum_of_square(n: i64) -> i64 {
    return n * (n + 1) * (2 * n + 1) / 6;
}

fn sum_of_sequence(n: i64) -> i64 {
    return n * (n + 1) / 2;
}

fn square_of_sum(n: i64) -> i64 {
    let s = sum_of_sequence(n);
    return s * s;
}

fn main() {
    let n: i64 = 100;
    let square_of_sum: i64 = square_of_sum(n);
    let sum_of_square: i64 = sum_of_square(n);
    println!("The square of the sum of 1 to {}: {}", n, square_of_sum);
    println!("Sum of squares from 1 to {}: {}", n, sum_of_square);
    println!("Difference between 'square of the sum' and 'Sum of squares': {}", square_of_sum - sum_of_square)
}
