use std::fs::File;
use std::io::prelude::*;
use std::io::BufReader;
use std::collections::HashMap;

fn check_one_pair(cards: [HashMap<&str, i32>; 5] , hand: &mut HashMap<&str, i32>) -> bool {

    hand.insert("rank", 1);
    hand.insert("value", 5);
    return true;
}

/*
  High Card: 1
  One Pair: 2
  Two Pairs: 3
  Three of a Kind: 4
  Straight: 5
  Flush: 6
  Full House: 7
  Four of a Kind: 8
  Straight Flush: 9
  Royal Flush: 10
*/
fn get_rank_of_hand(player_data: &str) -> HashMap<&str, i32> {
    let mut ret = HashMap::new();

    //dummy
    ret.insert("rank", 1);
    ret.insert("value", 5);
    return ret;
}

fn main() {
    let file = File::open("poker.txt").unwrap();
    let reader = BufReader::new(file);
    let mut count_wins_of_player1: u64 = 0;
    for line in reader.lines() {
        let inpute_line = line.unwrap();
        let mut player1_hand = get_rank_of_hand(&inpute_line[..15]);
        let mut player2_hand = get_rank_of_hand(&inpute_line[15..]);
        println!("{:?}, {:?}", player1_hand, player2_hand);
        println!("-----");
        if player1_hand["rank"] > player2_hand["rank"] {
            count_wins_of_player1 += 1;
        }
        if player1_hand["rank"] == player2_hand["rank"] {
            if player1_hand["value"] > player2_hand["value"] {
                count_wins_of_player1 += 1;
            }
        }
    }
    println!("{}", count_wins_of_player1);
}