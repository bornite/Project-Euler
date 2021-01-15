fn gen_next_term(a: Vec<usize>, b: Vec<usize>) -> Vec<usize> {
    let mut result = a.clone();
    let mut carry = 0;
    for i in 0..b.len() {
        if i >= result.len() {
            result.push(0);
        }
        let mut digit = result[i];
        digit = b[i] + digit + carry;
        carry = digit / 10;
        result[i] = digit % 10;
    }
    if carry > 0 {
        result.push(carry);
    }
    return result;
}

fn main() {
    let mut a = vec![0];
    let mut b = vec![1];
    let mut n = 1;
    while b.len() < 1000 {
        let tmp = b.clone();
        b = gen_next_term(a, b);
        a = tmp;
        n += 1;
    }
    b.reverse();
    println!("{:?}", b);
    println!("{}", n);
}