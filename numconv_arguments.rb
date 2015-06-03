
#****************Method to iterate over ARGV elements*************

def num_conv
  ARGV.each do |arg|
    #puts "#{arg}"
    l = arg.length
    #puts "Length is #{l}"
    number = arg.to_i
    #puts number
    
      case l
      when 1, 2
        result = ten_conversion(number)
        #result = result
        puts result.capitalize
        #puts "ten conversion"
      when 3  
        result = hundread_conversion(number)
        puts result.capitalize
        #puts "hundread conversion"
      when 4, 5, 6
        result = thousand_conversion(number) 
        puts result.capitalize
        #puts "thousand conversion"
      when  7, 8, 9
        result = million_conversion(number)
        puts result.capitalize
        #puts "milllion conversion"
      when 10, 11, 12
        result = billion_conversion(number)
        puts result.capitalize 
        #puts "billion conversion"     
      else
        puts "Too big number to convert!"
      end  
      
     end
end 

#**************************************************************************
#**************************************************************************
$numbers = 
  {0 =>"Zero",
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
$thousand_hash =
   {1000 => "One thousand",
    2000 => "Two thousand",
    3000 => "Three thousand",
    4000 => "Four thousand",
    5000 => "Five thousand",
    6000 => "Six thousand",
    7000 => "Seven thousand",
    8000 => "Eight thousand",
    9000 => "Nine thousand"}

$million_hash =
    {1000000 => "One million",
     2000000 => "Two million",
     3000000 => "Three million",
     4000000 => "Four million",
     5000000 => "Five million",
     6000000 => "Six million",
     7000000 => "Seven million",
     8000000 => "Eight million",
     9000000 => "Nine million"}

$billion_hash =
    {1000000000 => "One billion",
     2000000000 => "Two billion",
     3000000000 => "Three billion",
     4000000000 => "Four billion",
     5000000000 => "Five billion",
     6000000000 => "Six billion",
     7000000000 => "Seven billion",
     8000000000 => "Eight billion",
     9000000000 => "Nine billion"}       
#********************** Ten conversion **************
 def ten_conversion(n)
    n = n.to_i # converting string to integer. To avoild octal problem
    result = ""
    if $numbers.has_key?(n)
      ten = $numbers[n]
      #puts "ten is #{ten}"
      result << ten
    else
       ten = (n/10)*10
       one = n % 10
       
      if one != 0
        #puts $numbers[ten]
        result << "#{$numbers[ten]} #{$numbers[one]}"
        #puts result
      else
        result << "#{$numbers[ten]}"
        #puts result
      end
    end 
 end    

 # puts ten_conversion(11)
 # puts ten_conversion(25)
 # puts ten_conversion(30)
 #puts ten_conversion(8)
 # puts ten_conversion(0)
 # puts ten_conversion(99)
 #puts ten_conversion("08")  # This is throwing octal error

 #*********************************************************

 #********************** Hundread conversion **************
 def hundread_conversion(n)
    n = n.to_i 
     result = " "
     hundread, leftover_hundread = n.divmod(100)
     #puts "hundread is #{hundread}"
     #puts "leftover_hundread is #{leftover_hundread}"
    
      if hundread == 0 && leftover_hundread > 0 #this condition is to check for input like "089"
        hundread = ten_conversion(leftover_hundread)
        result << "#{hundread}" 
      elsif hundread == 0
        result << ""       
      else   
         if leftover_hundread == 0
            result << "#{$numbers[hundread]} hundread"
         elsif $numbers.has_key?(leftover_hundread)
            result << "#{$numbers[hundread]} hundread and #{$numbers[leftover_hundread]} "
         else 
            ten = ten_conversion(leftover_hundread)
            #puts "#ten from ten_conversion method #{ten}"
            result << "#{$numbers[hundread]} hundread and #{ten}"
        end
      end     
 end 

#puts hundread_conversion("120")
#puts hundread_conversion("900")
#puts hundread_conversion("789")
#puts hundread_conversion("089")
#puts hundread_conversion("181")
 #**********************************************************

 #********************** Thousand  conversion **************
 def thousand_conversion(n)
  n = n = n.to_i 
  result = ""
  if $thousand_hash.has_key?(n)
      thousand = $thousand_hash[n]
      result << thousand
  else
      thousand, leftover_thousand = n.divmod(1000)
      if thousand == 0 && leftover_thousand > 0 #this condition is to check for inputs like "0189"
        thousand = hundread_conversion(leftover_thousand)
        result << "#{thousand}"   
      elsif thousand == 0
        result << ""  
      elsif $numbers.has_key?(thousand) 
        #puts "Thousand is #{thousand}"
        #puts "leftover_thousand is #{leftover_thousand}"
        thousand = "#{$numbers[thousand]} thousand"
        if leftover_thousand == 0
           result << "#{thousand}"
        else   
          hundread = hundread_conversion(leftover_thousand)
          puts "Hundread from hundread_conversion method #{hundread}"
          result << "#{thousand} and #{hundread}"
          puts result
        end  
      else
        thousand = hundread_conversion(thousand)
        if leftover_thousand == 1
           hundread = "one"
           result = "#{thousand} and #{hundread}"
        elsif leftover_thousand == 0
           result = "#{thousand} thousand"
              
        else   
            hundread = hundread_conversion(leftover_thousand)
            #puts "Hundread from hundread_conversion method #{hundread}"
            result << "#{thousand} thousand and #{hundread}"
       end  
  end
 end
 result
end 

# puts thousand_conversion("9000")
 #puts thousand_conversion("1500")
# puts thousand_conversion("7893")
# puts thousand_conversion("0897")
# puts thousand_conversion("7053")
# puts thousand_conversion("6005")
#puts thousand_conversion("703896")
#puts thousand_conversion("30001")
#puts thousand_conversion("289000")

#****************************************************************

#********************** million conversion **************
def million_conversion(n)
  n = n.to_i
  result = " "
  if $million_hash.has_key?(n)
    million =$million_hash[n]
    result << million 
  else
    million, leftover_million =n.divmod(1000000)
    puts "million is #{million}"
    puts "leftover_million is #{leftover_million}"
    if million == 0 && leftover_million > 0  #this condition is to check inputs like "0150000"
       million = thousand_conversion(leftover_million)
       result <<"#{million}"
    elsif million == 0
       result << ""
    elsif $numbers.has_key?(million) 
        #puts "Million is #{million}"
        #puts "leftover_million is #{leftover_million}"
        million = "#{$numbers[million]} million"
        if leftover_million == 0
          result << "#{million}"
        else  

          thousand = thousand_conversion(leftover_million)
          #puts thousand
          #puts "Thousand from thousand_conversion method #{thousand}"
          #puts "*****************"
          result << "#{million} and #{thousand}"  
          #puts result
          #puts "*****************"
        end     
    else
        million = thousand_conversion(million)
        if leftover_million == 1 
            thousand = "one"
            result <<"#{million} million and #{thousand}"
        elsif leftover_million == 0
            result << "#{million} million"     
        else
            thousand = thousand_conversion(leftover_million)
            #puts "thousand from thousand_conversion method #{thousand}"
            result << "#{million} million and #{thousand}"
        end    
                 
    end    


  end  

end
#puts million_conversion("6000000")
#puts million_conversion("19289000")
#puts million_conversion("0987789")
#puts million_conversion("70004001")
#puts million_conversion("671890378")
#puts million_conversion("789000000")
#puts million_conversion("200000001")
#*************************************************************************
def billion_conversion(n)
  n = n.to_i
  result = ""
  if $billion_hash.has_key?(n)
    billion =$billion_hash[n]
    result << billion
  else
    billion, leftover_billion =n.divmod(1000000000)
    #puts "billion is #{billion}"
    #puts "leftover_billion is #{leftover_billion}"
    if billion == 0 && leftover_billion > 0  #this condition is to check inputs like "0150000"
       billion = million_conversion(leftover_billion)
       result <<"#{billion}"
    elsif billion == 0
       result << ""
    elsif $numbers.has_key?(billion) 
        #puts "Billion is #{billion}"
        #puts "leftover_billion is #{leftover_billion}"
        billion = "#{$numbers[billion]} billion"
        if leftover_billion == 0
          result << "#{billion}"
        else  
          million = billion_conversion(leftover_billion)
          #puts "billion from billion_conversion method #{million}"
          result << "#{billion}, and #{million}"
          #puts result
        end     
    else
        billion = million_conversion(billion)
        if leftover_billion == 1
          million = "one"
          result << "#{billion} billion, and #{million}"
        elsif leftover_billion == 0
          result << "#{billion} billion"   
        else  
          million = million_conversion(leftover_billion)
          #puts "million from million_conversion method #{million}"
          result << "#{billion} billion, and  #{million}"
        end  
    end    

  end  

end 

#puts billion_conversion("9000000000")
#puts billion_conversion("1200000001")
#puts billion_conversion("6789000000")
 
#***********************************************************************  



num_conv 


