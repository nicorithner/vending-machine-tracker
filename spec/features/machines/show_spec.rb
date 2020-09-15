require 'rails_helper'

RSpec.describe "Machine Show Page", type: :feature do
  before :each do
    @owner = Owner.create(name: "Don's Snacks")

    @dons  = @owner.machines.create(location: "Don's Mixed Drinks")

    @snack_1 = Snack.create!(name: "Snack_1", price: 6)
    @snack_2 = Snack.create!(name: "Snack_2", price: 3)
    @snack_3 = Snack.create!(name: "Snack_3", price: 1)
    @snack_4 = Snack.create!(name: "Snack_4", price: 8)
    @snack_5 = Snack.create!(name: "Snack_5", price: 10)

    MachineSnack.create!(machine: @dons, snack: @snack_1)
    MachineSnack.create!(machine: @dons, snack: @snack_2)
    MachineSnack.create!(machine: @dons, snack: @snack_3)
    MachineSnack.create!(machine: @dons, snack: @snack_4)
    MachineSnack.create!(machine: @dons, snack: @snack_5)
  end
  
  describe "As a visitor When I visit a vending machine show page" do
    it "I see the name of all of the snacks associated with that vending machine along with their price" do
      visit ("/machines/#{@snack_1.id}")
      
      expect(page).to have_content("#{@snack_1.name} .... #{@snack_1.price}")
      expect(page).to have_content("#{@snack_2.name} .... #{@snack_2.price}")
      expect(page).to have_content("#{@snack_3.name} .... #{@snack_3.price}")
      expect(page).to have_content("#{@snack_4.name} .... #{@snack_4.price}")
      expect(page).to have_content("#{@snack_5.name} .... #{@snack_5.price}")
      # binding.pry
    end
  end
end