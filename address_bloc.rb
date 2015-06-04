 require_relative "controllers/menu_controller"

menu = MenuController.new
#it clears command line
system "clear"

puts "Welcome to AddressBloc!"

menu.main_menu