# http://classic.battle.net/war3/human/units/footman.shtml

class Footman < Unit

  def initialize
    super(60, 10)
  end

  def attack!(enemy)
    if enemy.is_a? Barracks
      enemy.damage((attack_power / 2.0).ceil)
    else
      enemy.damage(attack_power)
    end
  end

end
