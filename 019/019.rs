
fn is_leap_year(y: u64) -> bool {
    if y % 400 == 0 {
        return true;
    }
    if y % 100 == 0 {
        return false;
    }
    if y % 4 == 0 {
        return true;
    }
    return false
}

fn days_of_year(y: u64) -> u64 {
    if is_leap_year(y) {
        return 366
    } else {
        return 365
    }
}

fn days_of_month(y: u64) -> [u64; 12] {
    [
        31,                                    // Jan
        if is_leap_year(y) { 29 } else { 28 }, // Feb
        31,                                    // Mar
        30,                                    // Apr
        31,                                    // May
        30,                                    // Jun
        31,                                    // Jul
        31,                                    // Aug
        30,                                    // Sep
        31,                                    // Oct
        30,                                    // Nov
        31,                                    // Dec
    ]
}

fn append_days(year: u64, offset: u64, result: &mut [u64; 7]) -> u64 {
    let mut day = offset;
    let days_of_month = days_of_month(year);
    for n in &days_of_month {
        result[day as usize] += 1;
        day = (day + *n) % 7;
    }
    return day
}

fn main() {
    let mut result = [0; 7];
    let mut day = 1; // Monday
    day = (day + days_of_year(1900)) % 7;
    for y in 1901..(2000 + 1) {
        day = append_days(y, day, &mut result);
        println!("{:?}", result)
    }
    println!("{}", result[0])
}