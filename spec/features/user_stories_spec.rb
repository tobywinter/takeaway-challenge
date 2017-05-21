require_relative '../spec_helper'

describe 'takeaway' do
  # As a customer
  # So that I can check if I want to order something
  # I would like to see a list of dishes with prices
  it 'so customers can select their order, display a list of dishes' do
    order = Order.new
    expect(order.view_menu).to eq(Menu::LIST_OF_DISHES)
  end
  # As a customer
  # So that I can order the meal I want
  # I would like to be able to select some number of several available dishes
  it 'so we can order multiple dishes, select and store each dish chosen' do
    order = Order.new
    order.view_menu
    order.add_dish("Chicken Chow Mein")
    order.add_dish("Spicy Chilli Beef")
    order.add_dish("Egg Fried Rice")
    expect{ order.add_dish("Kung Pow Chicken") }.to change{ order.current_order }.to eq([
       "Chicken Chow Mein",
       "Spicy Chilli Beef",
       "Egg Fried Rice",
       "Kung Pow Chicken"
       ])
  end
end
