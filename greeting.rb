def greeting
  names = []

  ARGV.each_with_index do |arg, i|
    if i == 0
      @greet = arg
    else 
      names << arg
    end
  end 
  names.each {|name| puts "#{@greet.capitalize} #{name.capitalize}"}   
    
end  

greeting

