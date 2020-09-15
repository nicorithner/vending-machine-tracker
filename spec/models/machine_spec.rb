require 'rails_helper'

RSpec.describe Machine, type: :model do
  
  describe 'validations' do
    it { should validate_presence_of :location }
    it { should belong_to :owner }
  end

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

  describe "Snack instance methods" do
    it "#average_price" do
      expect(@dons.average_price).to eq(5.6)
    end
  end
end
