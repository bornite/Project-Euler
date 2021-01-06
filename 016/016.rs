fn power(n: u64, m: u64) -> Vec<u64> {
    let mut decimal = vec![1];
    for _ in 0..m {
        let mut carry = 0;
        for i in 0..decimal.len() {
            let mut digit = decimal[i];
            digit = n * digit + carry;
            carry = digit / 10;
            decimal[i] = digit % 10;
        }
        if carry > 0 {
            decimal.push(carry);
        }
    }
    decimal.reverse();
    return decimal;
}

fn main() {
    println!("{:?}", power(2,1000));
    println!("{:?}", power(2,1000).iter().sum::<u64>());    
}