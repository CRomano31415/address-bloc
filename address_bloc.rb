require_relative 'controllers/menu_controller' #includes our new menu controller

menu = MenuController.new #creates a new controller named menu

system "clear" #clears the command line
puts "Welcome to AddressBloc"

menu.main_menu #calls the method main menu which will print out the menu
