fn factorial(n: u64) -> Vec<u64> {
    let mut decimal = vec![0; 200];
    decimal[0] = 1;
    for x in 1..(n+1) {
        let mut carry = 0;
        for i in 0..decimal.len() {
            let mut digit = decimal[i];
            digit = x * digit + carry;
            carry = digit / 10;
            decimal[i] = digit % 10;
        }
    }
    decimal.reverse();
    return decimal;
}

fn main() {
    println!("{:?}", factorial(100));
}