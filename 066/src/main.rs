extern crate num_bigint;
extern crate num_traits;

use num_bigint::BigInt;

fn main() {
    let mut result: u64 = 0;
    let mut pmax: BigInt = 0.into();

    for d in 2..=1000 {
        let limit_u64: u64 = (d as f64).sqrt() as u64; 
        let limit: BigInt = limit_u64.into();
        println!("limit:{}", limit);
        if (limit_u64 * limit_u64 == d) {
            println!("d is Square number:{}", d);
            continue;
        }
        let mut m: BigInt = 0.into();
        let mut dd: BigInt = 1.into();
        let mut a: BigInt = limit.clone();
    
        let mut numm1: BigInt = 1.into();
        let mut num: BigInt = a.clone();
     
        let mut denm1: BigInt = 0.into();
        let mut den: BigInt = 1.into();
    
        println!("m:{}, dd:{}, a:{}, numm1:{}, num:{}, denm1:{}, den:{}", m, dd, a, numm1, num, denm1, den);
        let mut check: BigInt = 0.into();

        while check!= 1.into() {

            m = dd.clone() * a.clone() - m.clone();
            dd = (d.clone() - m.clone() * m.clone()) / dd.clone();
            a = (limit.clone() + m.clone()) / dd.clone();
     
            let numm2: BigInt = numm1;
            numm1 = num.clone();
            let denm2: BigInt = denm1;
            denm1 = den.clone();

            num = (a.clone())*(numm1.clone()) + numm2.clone();
            den = a.clone() * denm1.clone() + denm2;
            check = (num.clone())*(num.clone()) - (d.clone())*(den.clone())*(den.clone());
        }
        println!("m:{}, dd:{}, a:{}, numm1:{}, num:{}, denm1:{}, den:{}", m, dd, a, numm1, num, denm1, den);
        if (num > pmax) {
            pmax = num.clone();
            result = d.clone();
        }    
    }

    println!("result:{}", result);
    println!("pmax:{}", pmax);
}

/*
 
for(int D = 2; D <= 1000; D++){
    BigInteger limit = (int)Math.Sqrt(D);
    if (limit * limit == D) continue;
 
    BigInteger m = 0;
    BigInteger d = 1;
    BigInteger a = limit;
 
    BigInteger numm1 = 1;
    BigInteger num = a;
 
    BigInteger denm1 = 0;
    BigInteger den = 1;
 ---
    while(num*num - D*den*den != 1){
        m = d * a - m;
        d = (D - m * m) / d;
        a = (limit + m) / d;
 
        BigInteger numm2 = numm1;
        numm1 = num;
        BigInteger denm2 = denm1;
        denm1 = den;
 
        num = a*numm1 + numm2;
        den = a * denm1 + denm2;
    }
 
    if (num > pmax) {
        pmax = num;
        result = D;
    }
}
*/