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

    before :each do
      @footman = Footman.new
    end

    describe "#attack!" do
      it "should deal 1/2 AP as damage to the enemy barracks" do
        expect(@footman).to receive(:attack_power).and_return(10)        
        expect(@barracks).to receive(:damage).with(5)
        @footman.attack!(@barracks)
      end
    end

    describe "#damage" do
      it "should reduce the barracks' health_points by damage specified" do
        @barracks.damage(2)
        expect(@barracks.health_points).to eq(498)
      end

      # # input tests --> redundant
      # it 'should take a Fixnum parameter' do
      #   expect {@barracks.damage(10)}.not_to raise_error
      # end

      # # ADD EDGE CASES LIKE ARRAYS, STRINGS, FLOATS AND NIL

      # test odd number AP
      it 'rounds damage up to nearest integer' do
        expect(@footman).to receive(:attack_power).and_return(5)
        expect(@barracks).to receive(:damage).with(3)
        @footman.attack!(@barracks)
      end
    end 
  end

end