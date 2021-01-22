/*
Example for n = 5, 7, 9

21	22	23	24	25
20	7	8	9	10
19	6	1	2	11
18	5	4	3	12
17	16	15	14	13

43  44  45  46  47  48  49
42  21	22	23	24	25  26
41  20	7	8	9	10  27
40  19	6	1	2	11  28
39  18	5	4	3	12  29
38  17	16	15	14	13  30
37  36  35  34  33  32  31

73  74  75  76  77  78  79  80  81
72  43  44  45  46  47  48  49  50
71  42  21	22	23	24	25  26  51
70  41  20	7	8	9	10  27  52
69  40  19	6	1	2	11  28  53
68  39  18	5	4	3	12  29  54
67  38  17	16	15	14	13  30  55
66  37  36  35  34  33  32  31  56
65  64  63  62  61  60  59  58  57

*/
/*
Upper right => 25, 49, 81
            => n^2
Upper left  => 21, 43, 73 => 25 - 4, 49 - 6, 81 - 8
            => n^2 - n + 1
Lower left  => 17, 37, 65 => 21 - 4, 43 - 6, 73 - 8
            => n^2 - 2n + 2
Lower right => 13, 31, 57 = 17 - 4, 37 - 6, 65 - 8
            => n^2 - 3n + 3
*/
/*
sum[n] = 4n^2 - 6n + 6
*/

fn sum_of_numbers_on_diagonals(n: u64) -> u64 {
	let sum = (1..n+1)
        .map(|i| {
            let j = 2 * i + 1;
            4 * j * j - 6 * j + 6
        })
        .sum::<u64>() + 1;
	return sum;
}

fn main() {
    println!("{}", sum_of_numbers_on_diagonals(500));
}