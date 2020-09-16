require 'rails_helper'

RSpec.describe "Snack Show Page", type: :feature do
  before :each do
    @owner = Owner.create(name: "Don's Snacks")
    @owner = Owner.create(name: "Sam's Snacks")

    @dons  = @owner.machines.create(location: "Don's Mixed Drinks")
    @sams  = @owner.machines.create(location: "Sam's Snacks")

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
    MachineSnack.create!(machine: @sams, snack: @snack_1)
    MachineSnack.create!(machine: @sams, snack: @snack_2)
    MachineSnack.create!(machine: @sams, snack: @snack_3)
  end

  describe "As a visitor When I visit a snack show page" do
    describe "displays snack details" do
      it "displays snack name" do
        visit ("/snacks/#{@snack_1.id}")
        expect(page).to have_content("#{@snack_1.name}")
      end

      it "displays snack price" do
        visit ("/snacks/#{@snack_1.id}")
        expect(page).to have_content("Price: $#{@snack_1.price}")
      end

      it "displays snack list of locations" do
        visit ("/snacks/#{@snack_1.id}")

        within("#machines-#{@dons.id}") do
          expect(page).to have_content("Available at: #{@dons.location}")
        end
      end

      it "displays machine's average price for snacks and snacks count" do
        visit ("/snacks/#{@snack_1.id}")
save_and_open_page
        within("#machines-#{@dons.id}") do
          expect(page).to have_content("Average snack price: #{@dons.average_price}")
          expect(page).to have_content("Snacks count: #{@dons.snack_count}")
        end
      end
    end
  end
end