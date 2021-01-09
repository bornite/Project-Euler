use std::cmp::max;

const INPUT_DATA: &str = "
75
95 64
17 47 82
18 35 87 10
20 04 82 47 65
19 01 23 75 03 34
88 02 77 73 07 63 67
99 65 04 28 06 16 70 92
41 41 26 56 83 40 80 70 33
41 48 72 33 47 32 37 16 94 29
53 71 44 65 25 43 91 52 97 51 14
70 11 33 28 77 73 17 78 39 68 17 57
91 71 52 38 17 14 91 43 58 50 27 29 48
63 66 04 68 89 53 67 30 73 16 69 87 40 31
04 62 98 27 23 09 70 98 73 93 38 53 60 04 23
";

fn parse(s: &str) -> Vec<Vec<u64>> {
    let mut graph: Vec<Vec<u64>> = s
        .trim()
        .lines()
        .map(|line| line.split(' ').map(|s| s.parse::<u64>().unwrap()).collect())
        .collect();

        return graph;
}

fn find_path(triangle: Vec<Vec<u64>>) -> u64 {
    let mut graph: Vec<Vec<u64>> = triangle;
    for row in (0..(graph.len() - 1)).rev() {
        for i in 0..graph[row].len() {
            graph[row][i] += max(graph[row + 1][i], graph[row + 1][i + 1]);
        }
    }
    return graph[0][0];
}

fn main() {
    let mut triangle: Vec<Vec<u64>> = parse(INPUT_DATA);
    println!("{:?}", triangle);
    println!("{}", find_path(triangle));
}