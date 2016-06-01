require_relative 'spec_helper'

describe Barracks do
  before :each do
    @barracks = Barracks.new
  end

  it "has and knows its HP (health points)" do
    expect(@barracks.health_points).to eq(500)
  end


  describe Unit do

    describe '#attack!' do
      it "should deal 10 (AP) damage to the enemy barracks" do
        expect(@barracks).to receive(:damage).with(10)
        Unit.new(100,10).attack!(@barracks)
      end
    end

  end

  describe Footman do 

    describe "#attack!" do
      it "should do deal 1/2 of AP as damage to the enemy barracks" do
        expect(@barracks).to receive(:damage).with(5) # was 10
        Footman.new.attack!(@barracks)
      end
    end

    describe "#damage" do
      it "should reduce the barracks' health_points by 1/2 the attack_power specified" do
        @barracks.damage(2)
        expect(@barracks.health_points).to eq(498) # starts at 60
      end

      # # input tests --> redundant
      # it 'should take a Fixnum parameter' do
      #   expect {@barracks.damage(10)}.not_to raise_error
      # end

      # # ADD EDGE CASES LIKE ARRAYS, STRINGS, FLOATS AND NIL

      it 'rounds damage up to nearest integer' do
        @barracks = Barracks.new
        footman = Footman.new
        expect(footman).to receive(:attack_power).and_return(5)
        expect(@barracks).to receive(:damage).with(3)
        footman.attack!(@barracks)
      end
    end 
  end

end