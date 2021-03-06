=begin
Example for n = 5, 7, 9

21  22  23  24  25
20  7   8   9   10
19  6   1   2   11
18	5   4   3   12
17  16  15	14  13

43  44  45  46  47  48  49
42  21  22  23  24  25  26
41  20  7   8   9   10  27
40  19  6   1   2   11  28
39  18  5   4   3   12  29
38  17  16  15  14  13  30
37  36  35  34  33  32  31

73  74  75  76  77  78  79  80  81
72  43  44  45  46  47  48  49  50
71  42  21  22  23  24  25  26  51
70  41  20  7   8   9   10  27  52
69  40  19  6   1   2   11  28  53
68  39  18  5   4   3   12  29  54
67  38  17  16  15  14  13  30  55
66  37  36  35  34  33  32  31  56
65  64  63  62  61  60  59  58  57

Upper right => 25, 49, 81
            => n^2
Upper left  => 21, 43, 73 => 25 - 4, 49 - 6, 81 - 8
            => n^2 - n + 1
Lower left  => 17, 37, 65 => 21 - 4, 43 - 6, 73 - 8
            => n^2 - 2n + 2
Lower right => 13, 31, 57 = 17 - 4, 37 - 6, 65 - 8
            => n^2 - 3n + 3
(n is odd number)

sum[n] = 4n^2 - 6n + 6
=end

class Problem028
    # Calculate the sum of the four corners of the n-th spiral.
    def sum_of_nth_spiral(n)
        m = (n / 2)
        (1..m).to_a.map { |i|
            k = 2 * i + 1
            4 * (k**2) - 6*k + 6
        }.sum + 1
    end
    def compute()
        sum_of_nth_spiral(1001)
    end
end
p Problem028.new().compute()