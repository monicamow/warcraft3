class SiegeEngine < Unit


  def initialize
    super(400, 50)
  end

  def attack!(enemy)
    if enemy.is_a? Barracks
      enemy.damage(attack_power * 2)
    elsif enemy.is_a? SiegeEngine # other siege engines
      enemy.damage(attack_power)
    else
      # cannot attack any other unit (peasant or footman)
      return'cannot attack a peasant or footman'
    end
  end

  def damage(amount)
    @health_points -= amount
  end

end

