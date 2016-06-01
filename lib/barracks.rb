class Barracks

  attr_reader :gold, :food, :lumber, :health_points

  def initialize
    @gold = 1000
    @food = 80
    @lumber = 500
    @health_points = 500
  end

  def can_train_footman?
    food >= 2 && gold >= 135
  end

  def train_footman
    if can_train_footman?
      @gold -= 135
      @food -= 2
      footman = Footman.new
    else 
      nil
    end
  end

  def can_train_peasant?
    food >= 5 && gold >= 90
  end

  def train_peasant
    if can_train_peasant?
      @gold -= 90
      @food -= 5
      peasant = Peasant.new
    else
      nil
    end
  end

  def can_build_siege_engine?
    food >= 3 && gold >= 200 && lumber >= 60
  end

  def build_siege_engine
    if can_build_siege_engine?
      @gold -= 200
      @food -= 3
      @lumber -= 60
      siege_engine = SiegeEngine.new
    else 
      nil
    end
  end

  # no def attack!...barracks can't attack

  def damage(amount)
    @health_points -= amount
  end
  
end




