require_relative 'spec_helper'

describe Barracks do 
# barracks creating siege engine

  before :each do
    @barracks = Barracks.new
  end

  describe '#can_build_siege_engine?' do

    it 'should return true if there are enough resources' do
      # should return true since barracks start off with enough resources
      expect(@barracks.can_build_siege_engine?).to be_truthy
    end

    it 'should return false if not enough gold' do
      expect(@barracks).to receive(:gold).and_return(100)
      expect(@barracks.can_build_siege_engine?).to be_falsey
    end

    it 'should return false if not enough food' do
      expect(@barracks).to receive(:food).and_return(2)
      expect(@barracks.can_build_siege_engine?).to be_falsey
    end

    it 'should return false if not enough lumber' do
      expect(@barracks).to receive(:lumber).and_return(50)
      expect(@barracks.can_build_siege_engine?).to be_falsey 
    end

  end

  describe '#build_siege_engine' do

    it 'should not build a siege engine if there are not enough resources' do
      expect(@barracks).to receive(:can_build_siege_engine?).and_return(false)
      expect(@barracks.build_siege_engine).to be_nil
    end

    it 'should build a siege engine if there are enough resources' do
      expect(@barracks).to receive(:can_build_siege_engine?).and_return(true)
      expect(@barracks.build_siege_engine).to be_a(SiegeEngine)
    end

    it "costs 200 gold" do
      @barracks.build_siege_engine
      expect(@barracks.gold).to eq(800) # starts at 1000
    end

    it "costs 3 food" do
      @barracks.build_siege_engine
      expect(@barracks.food).to eq(77) # starts at 80
    end

    it "costs 60 lumber" do
      @barracks.build_siege_engine
      expect(@barracks.lumber).to eq(440) # starts at 500
    end

    it "produces a footman unit" do
      siege_engine = @barracks.build_siege_engine
      expect(siege_engine).to be_an_instance_of(SiegeEngine)
    end

  end

end

describe SiegeEngine do
# siege engine behaviour

  before :each do
    @siege_engine = SiegeEngine.new
    @barracks = Barracks.new
  end

  it "has and knows its HP (health points)" do
    expect(@siege_engine.health_points).to eq(400)
  end

  it "has and knows its AP (attack power)" do
    expect(@siege_engine.attack_power).to eq(50)
  end

  describe '#attack' do

    # can attack Barracks and other SiegeEngine but not Peasant or Footman
    it "should deal 2x AP as damage to the enemy barracks" do
      expect(@siege_engine).to receive(:attack_power).and_return(10)        
      expect(@barracks).to receive(:damage).with(20)
      @siege_engine.attack!(@barracks)
    end

    it "should deal AP (1 to 1) as damage to the enemy siege engine" do
      enemy_siege_engine = SiegeEngine.new
      expect(@siege_engine).to receive(:attack_power).and_return(10)        
      expect(enemy_siege_engine).to receive(:damage).with(10)
      @siege_engine.attack!(enemy_siege_engine)
    end

    it "should not be able to attack Peasant or Footman" do
      peasant = Peasant.new
      footman = Footman.new
      expect(@siege_engine.attack!(peasant)).to eq("cannot attack a peasant or footman")
      expect(@siege_engine.attack!(footman)).to eq("cannot attack a peasant or footman")
    end

  end

  describe '#damage' do

    # deals 2x AP against Barracks and 0 AP to other SiegeEngine
    it "should reduce the barracks' health_points by damage specified" do
      @barracks.damage(2)
      expect(@barracks.health_points).to eq(498)
    end
    
  end

end