fn count_ways(sum: u64, coins: &[u64]) -> u64 {
    if coins.len() == 1 {
        return 1;
    }

    let mut answer = 0u64;
    for n in 0..(sum / coins[0] + 1) {
        let d = sum - n * coins[0];
        answer += count_ways(d, &coins[1..]);
    }
    return answer;
}

fn main() {
    let coins = &[200, 100, 50, 20, 10, 5, 2, 1];
    let sum = 200;
    println!("{}", count_ways(sum, coins));
}