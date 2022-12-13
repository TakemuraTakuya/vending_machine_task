require "pry"
require_relative "suica"
require_relative "drink"

suica = Suica.new
drink = Drink.new
stock = Stock.new
vendhing_machine = Vendhing_Machine.new()

suica.chage_money
vendhing_machine.buy

