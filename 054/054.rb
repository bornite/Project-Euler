class Problem054

  def get_card_value(value)
    case value
      in "1".."9"
        value.to_i
      in "T"
        10
      in "J"
        11
      in "Q"
        12
      in "K"
        13
      in "A"
        14
    end
  end

  def parse_card_data(hand)
    result = []
    hand.each do |c|
      result.push({:value => get_card_value(c[0]), :suit => c[1]})
    end
    result.sort_by { |a| a[:value] }
  end

  def get_values_from_hand(parsed_data)
    result = []
    parsed_data.each{ |card| result.push(card[:value]) }
    result
  end

=begin
Table of rank.
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
=end
  def high_card?(parsed_data)
    highest = rank = 0
    values = get_values_from_hand(parsed_data)
    values.each do |v|
      highest = v
      rank = 1
    end
    return rank, highest
  end

  def one_pair?(parsed_data)
    highest = rank = 0
    values = get_values_from_hand(parsed_data)
    check = values.group_by{|v| v}.map{|k, v| [k, v.size]}.to_h.select{|k, v| v == 2}
    if check.size == 1
      check.each do |k,v|
        highest = k
        rank = 2
      end
    end
    return rank, highest
  end

  def two_pair?(parsed_data)
    highest = rank = 0
    values = get_values_from_hand(parsed_data)
    check = values.group_by{|v| v}.map{|k, v| [k, v.size]}.to_h.select{|k, v| v == 2}
    if check.size == 2
      check.each do |k,v|
        highest = k
        rank = 3
      end
    end
    return rank, highest
  end

  def three_card?(parsed_data)
    highest = rank = 0
    values = get_values_from_hand(parsed_data)
    check = values.group_by{|v| v}.map{|k, v| [k, v.size]}.to_h.select{|k, v| v == 3}
    check.each do |k,v|
      highest = k
      rank = 4
    end
    return rank, highest
  end

  def straight?(parsed_data)
    highest = rank = 0
    values = get_values_from_hand(parsed_data)
    if values[1] == values[0] + 1 &&
      values[2] == values[1] + 1 &&
      values[3] == values[2] + 1 &&
      values[4] == values[3] + 1
      rank = 5
      highest = values[4]
    end
    return rank, highest
  end

  def flush?(parsed_data)
    highest = rank = 0
    suit = parsed_data[0][:suit]
    if parsed_data.each.all?{|x| x[:suit] == suit }
      rank = 6
      highest = parsed_data[4][:value]
    end
    return rank, highest
  end

  def full_house?(parsed_data)
    highest = rank = 0
    values = get_values_from_hand(parsed_data)
    check_two_card = values.group_by{|v| v}.map{|k, v| [k, v.size]}.to_h.select{|k, v| v == 2}
    check_three_card = values.group_by{|v| v}.map{|k, v| [k, v.size]}.to_h.select{|k, v| v == 3}
    if check_two_card.size > 0 && check_three_card.size > 0
      check_three_card.each do |k,v|
        rank = 7
        highest = k
      end
    end    
    return rank, highest
  end

  def four_card?(parsed_data)
    highest = rank = 0
    values = get_values_from_hand(parsed_data)
    check = values.group_by{|v| v}.map{|k, v| [k, v.size]}.to_h.select{|k, v| v == 4}
    check.each do |k,v|
      highest = k
      rank = 8
    end
    return rank, highest
  end

  def straight_flush?(parsed_data)
    highest = rank = 0
    values = get_values_from_hand(parsed_data)
    suit = parsed_data[0][:suit]
    if parsed_data.each.all?{|x| x[:suit] == suit }
      if values[1] == values[0] + 1 &&
        values[2] == values[1] + 1 &&
        values[3] == values[2] + 1 &&
        values[4] == values[3] + 1
        rank = 9
        highest = values[4]
      end
    end
    return rank, highest
  end

  def royal_flush?(parsed_data)
    highest = rank = 0
    values = get_values_from_hand(parsed_data)
    suit = parsed_data[0][:suit]
    if parsed_data.each.all?{|x| x[:suit] == suit }
      if values[0] == 10 &&
        values[1] == 11 &&
        values[2] == 12 &&
        values[3] == 13 &&
        values[4] == 14
        rank = 10
        highest = values[4]
      end
    end
    return rank, highest
  end

  def get_rank_of_hand(hand)
    result = {:rank => 0, :highest => 0}
    parsed_data = parse_card_data(hand)

    # Checking for hand rank
    rank, highest = royal_flush?(parsed_data)
    if rank != 0
      result[:rank] = rank
      result[:highest] = highest
      return result
    end
    rank, highest = straight_flush?(parsed_data)
    if rank != 0
      result[:rank] = rank
      result[:highest] = highest
      return result
    end
    rank, highest = four_card?(parsed_data)
    if rank != 0
      result[:rank] = rank
      result[:highest] = highest
      return result
    end
    rank, highest = full_house?(parsed_data)
    if rank != 0
      result[:rank] = rank
      result[:highest] = highest
      return result
    end
    rank, highest = flush?(parsed_data)
    if rank != 0
      result[:rank] = rank
      result[:highest] = highest
      return result
    end
    rank, highest = straight?(parsed_data)
    if rank != 0
      result[:rank] = rank
      result[:highest] = highest
      return result
    end
    rank, highest = three_card?(parsed_data)
    if rank != 0
      result[:rank] = rank
      result[:highest] = highest
      return result
    end
    rank, highest = two_pair?(parsed_data)
    if rank != 0
      result[:rank] = rank
      result[:highest] = highest
      return result
    end
    rank, highest = one_pair?(parsed_data)
    if rank != 0
      result[:rank] = rank
      result[:highest] = highest
      return result
    end
    rank, highest = high_card?(parsed_data)
    if rank != 0
      result[:rank] = rank
      result[:highest] = highest
      return result
    end
    result
  end

  def game(player1_hand, player2_hand)
    puts "---"
    puts player1_hand.to_s, "vs", player2_hand.to_s
    puts "==="
    player1_hand_rank = get_rank_of_hand(player1_hand.sort)
    player2_hand_rank = get_rank_of_hand(player2_hand.sort)
    p player1_hand_rank, player2_hand_rank
    if player1_hand_rank[:rank] > player2_hand_rank[:rank]
      return true
    end
    if player1_hand_rank[:rank] == player2_hand_rank[:rank]
      return (player1_hand_rank[:highest] > player2_hand_rank[:highest])
    end
    return false
  end

  def compute()
    count_wins_of_player1 = 0
    File.open("poker.txt") do |f|
      f.each_line do |line|
        line.chomp!
        data = line.split(' ')
        player1_hand = data[0..4]
        player2_hand = data[5..9]
        if game(player1_hand, player2_hand)
          puts "player1 win."
          count_wins_of_player1 += 1
        end
      end
    end
    count_wins_of_player1
  end
end
p Problem054.new().compute()