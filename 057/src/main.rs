extern crate num_bigint;
extern crate num_traits;

use num_bigint::BigUint;
use num_traits::FromPrimitive;
use std::mem;

// a[0] = 1 + 1/2
// a[1] = 1 + 1/(2 + 1/2)
//      = 1 + 1/(1 + a[0]) =
// a[2] = 1 + 1/(2 + 1/(2 + 1/2))
//      = 1 + 1/(1 + a[1])
// a[i+1] = n[i+1] / d[i+1]
//        = 1 + 1 / (1 + n[i]/d[i])
//        = 1 + d[i] / (d[i] + n[i])
//        = (2d[i] + n[i]) / (d[i] + n[i])
//  n[0] = 3, d[0] = 2
//  n[i+1] = 2d[i] + n[i]
//  d[i+1] = d[i] + n[i]
struct Frac {
    nd: (BigUint, BigUint),
}

impl Frac {
    fn new() -> Frac {
        Frac {
            nd: (
                FromPrimitive::from_usize(3).unwrap(),
                FromPrimitive::from_usize(2).unwrap(),
            ),
        }
    }
}

impl Iterator for Frac {
    type Item = (BigUint, BigUint);

    fn next(&mut self) -> Option<(BigUint, BigUint)> {
        let next = {
            let (ref n, ref d) = self.nd;
            ((d << 1) + n, n + d)
        };
        Some(mem::replace(&mut self.nd, next))
    }
}

fn main() {
    let answer = Frac::new()
        .take(1000)
        .filter(|&(ref n, ref d)| n.to_string().len() > d.to_string().len())
        .count()
        .to_string();
    println!("{}", answer);
}