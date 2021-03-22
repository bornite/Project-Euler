
fn gen_cubic_numbers(limit: usize) -> Vec<i128> {
    let mut vec = Vec::new();
    for i in 1.. {
        let n = (i as i128).pow(3);
        if n.to_string().chars().count() > limit {
            break;
        }
        vec.push(n);
    }
    return vec;
}

fn main() {
    let cubic_numbers = Vec::new();
    cubic_numbers = gen_cubic_numbers(5);
    println!("{:?}", cubic_numbers);
}