extern crate itertools;
use std::collections::HashMap;

fn gen_cubic_numbers(lower_limit: usize, upper_limit: usize) -> Vec<i128> {
    let mut vec = Vec::new();
    for i in 1.. {
        let n = (i as i128).pow(3);
        if n.to_string().chars().count() < lower_limit {
            continue;
        }
        if n.to_string().chars().count() > upper_limit {
            break;
        }
        vec.push(n);
    }
    return vec;
}

fn main() {
    let cubic_numbers: Vec<i128> = gen_cubic_numbers(11, 12);
    let mut result: HashMap<String, Vec<i128>> = HashMap::new();

    for c in cubic_numbers {
        println!("c: {}", c);
        let mut digits: Vec<char> = c.to_string().chars().collect();
        println!("digits: {:?}", digits);
        let mut s: Vec<String> = digits.iter().map(|d| d.to_string()).collect();
        s.sort();
        let key: String = s.join("");
        println!("key: {}", key);
        if result.contains_key(&key) {
            println!("contains_key:yes");
            let mut t: Vec<i128> = result.get(&key).unwrap().to_vec();
            t.push(c);
            result.insert(key, t);
        }
        else {
            println!("not contains_key:no");
            let mut t: Vec<i128> = Vec::new();
            t.push(c);
            result.insert(key, t);
        }
    }
    println!("result:{:?}", result);
}