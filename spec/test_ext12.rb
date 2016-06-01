require_relative 'spec_helper'

# unit
describe Unit do 

  before :each do
    @unit = Unit.new(100,100)
    @enemy_unit = Unit.new(100,100)
  end

# if health_points < 1, dead? is true
# - force health points to 0
# - test if dead is true
  describe '#dead?' do
    it 'should return true if health points are 0' do
      expect(@unit).to receive(:health_points).and_return(0)
      expect(@unit.dead?).to be_truthy
    end
  end

  describe '#can_attack?' do

# dead Unit cannot attack another unit
    it 'should return false if self.dead? is true' do
      expect(@unit).to receive(:dead?).and_return(true)
      expect(@unit.can_attack?(@enemy_unit)).to be_falsey
    end

# live Unit cannot attack dead unit
    it 'should return false if enemy.dead? is true' do
      expect(@enemy_unit).to receive(:dead?).and_return(true)
      expect(@unit.can_attack?(@enemy_unit)).to be_falsey
    end


  end

end