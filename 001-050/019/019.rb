class Problem019
   def is_leap_year(y)
      ret = false
      if y % 4 == 0
         if y % 100 != 0
            ret = true
         else
            if y % 400 == 0
               ret = true
            end
         end
      end
   end

   def count_months_in_which_first_day_is_sunday(number_of_days_in_month)
      count = 0
      days = 1 # 1901-01-01 is Tuesday
      p number_of_days_in_month

      1901.upto(2000) do |y|
         number_of_days_in_month.each do |month, num_of_days|
            days = days + num_of_days
            if is_leap_year(y) && month == :Feb
               days = days + 1
            end
            # Check the day of the week at the end of the month.
            # 6 is Saturday
            if days % 7 == 6
               count = count + 1
            end
         end
      end
      return count
   end

   def compute()
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
      count_months_in_which_first_day_is_sunday(number_of_days_in_month)
   end

   #another solution
   require 'date'
   def count_months_in_which_first_day_is_sunday2(start_year, end_year)
      Date.new(start_year,1,1).upto(Date.new(end_year,12,31)).find_all { |d| d.mday == 1 && d.wday == 0 }.count
   end

   def compute_another_solution()
      count_months_in_which_first_day_is_sunday2(1901, 2000)
   end
end
p Problem019.new().compute()
p Problem019.new().compute_another_solution()