use std::fs::File;
use std::io::prelude::*;
use std::io::BufReader;

fn main() {
    let file = File::open("poker.txt").unwrap();
    let reader = BufReader::new(file);
    for line in reader.lines() {
        let mut data = Vec::new();
        let tmp = line.unwrap();
        for s in tmp.split(" ") {
            data.push(s);
        }
        println!("{:?}", data);
    }
}