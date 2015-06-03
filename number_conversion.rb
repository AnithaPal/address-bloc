$numbers = 
  { 0 =>"Zero",
   1 => "One",
   2 => "Two", 
   3 => "Three",
   4 =>  "Four", 
   5 => "Five",
   6 =>  "Six",
   7 => "Seven",
   8 =>  "Eight", 
   9 => "Nine",
   10 => "Ten",
   11 => "Eleven",
   12 => "Twelve", 
   13 => "Thirteen",
   14 => "Fourteen", 
   15 => "Fifteen", 
   16 => "Sixteen", 
   17 => "Seventeen", 
   18 => "Eighteen", 
   19 => "Nineteen",
   20 => "Twenty", 
   30 => "Thirty", 
   40 => "Fourty", 
   50 => "Fifty", 
   60 => "Sixty", 
   70 => "Seventy", 
   80 => "Eighty",
   90 =>  "Ninety"}

def convert_number_to_word(n)
  
  result = " "
  billion, leftover_billion = n.divmod(1000000000)
   if billion <= 19
      billion = $numbers[billion]
    elsif (billion <= 99 && billion >19) 
      billion = ten_conversion(billion)
    else 
      billion = hundread_conversion(billion)
    end   

  
  #puts "After converting no to word: #{billion}"     
  if leftover_billion == 0 
      result << "#{billion} billion" 
      #puts "Result after billion converion (leftover 0): #{result}"   
  elsif leftover_billion == 1
       result << "#{billion} billion and one"
       #puts "Result after billion converion(leftover1) : #{result}"
  else     
       result << "#{billion} billion" 
       #billion conversion starts
       #puts "Result after billion converion (leftover) #{result}"
       million, leftover_million = leftover_billion.divmod(1000000)
       if million <= 19
          million = $numbers[million]
       elsif (million <= 99 && million >19) 
          million = ten_conversion(million)
       else 
          million = hundread_conversion(million)
       end  
       #million = hundread_conversion(million)
       #puts "After converting no to word: #{million}"    
       #puts "million: #{million}, leftover_million: #{leftover_million}" 
        if leftover_million == 0
          result << "#{million} million"
          #puts "Result after million converion (leftover 0): #{result}"
        elsif  leftover_million == 1
          result << " #{million} million and one"
          #puts "Result after million converion(leftover1) : #{result}"
        else 
          result << " #{million} million" 
          #puts "Result after million converion (leftover) #{result}"
          thousand, leftover_thousand = leftover_million.divmod(1000)
          thousand = hundread_conversion(thousand)
          #puts "After converting no to word: #{thousand}"
          if leftover_thousand == 0
             result << "#{thousand} thousand"
          elsif leftover_thousand == 1
            result << "#{thousand} and one"
          else
            result << "#{thousand} thousand"
            #puts result
            hundread, leftover_hundread = leftover_thousand.divmod(100)
            hundread = hundread_conversion(hundread)
            #result << " #{hundread} hundread"
            if leftover_hundread == 0
              result << result << "#{hundread} hundread"
            elsif leftover_hundread == 1
              result << " #{hundread} and one" 
            else
              result << " #{hundread} hundread"
              ten = ten_conversion(leftover_hundread)
              result << " #{ten}"
              puts result
            end

            
          end       
        end          
  end
end      
       
  

def hundread_conversion(n)

  result = " "
  if  n < 100
    n = n.to_s(8).to_i
    #puts "n is #{n}"
    result = ten_conversion(n)
  else   
    hundread,leftover_hun = n.divmod(100)
    if (leftover_hun == 0)
      result << "#{$numbers[hundread]} hundread "  
    else  
      ten = (leftover_hun/10)* 10
      #puts ten
      one = leftover_hun % 10
      if one != 0
        result << "#{$numbers[hundread]} hundread and #{$numbers[ten]} #{$numbers[one]}"
      else
        result << "#{$numbers[hundread]} hundread and #{$numbers[ten]}"
      end           
    end 
  end   
end  

def ten_conversion(n)
  result = ""
  if n < 10
    result = "#{$numbers[n.to_i]}"
  else  
    ten = (n/10)* 10
    #puts ten
    one = n % 10
    if one != 0
      result << "#{$numbers[ten]} #{$numbers[one]}"
    else
      result << "#{$numbers[ten]}"
    end  
  end  
end    



convert_number_to_word(11200000001)
puts "*****************************"
convert_number_to_word(1200890451)
puts "*****************************"
convert_number_to_word(4577888891)
puts "*****************************"
#convert_number_to_word(1200055000)
puts "*****************************"
#puts hundread_conversion(011)
puts "*****************************"
#puts ten_conversion(55)