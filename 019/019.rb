number_of_days_in_month = {
    "Jan": 31,
    "Feb": 28,
    "Mar": 31,
    "Apr": 30,
    "May": 31,
    "Jun": 30,
    "Jul": 31,
    "Aug": 31,
    "Sep": 30,
    "Oct": 31,
    "Nov": 30,
    "Dec": 31,
}
days = 1 # 1901-01-01 is Tuesday
count_of_sunday = 0

p number_of_days_in_month
1901.upto(2000) do |y|
   number_of_days_in_month.each do |month, num_of_days|
      days = days + num_of_days
      if (y+1).div(4) == 0 && month == :Feb
         days = days + 1
      end
      if days % 7 == 6
        count_of_sunday = count_of_sunday + 1
      end
   end
end
p count_of_sunday