class Unit

  attr_reader :health_points, :attack_power

  def initialize(health_points, attack_power)
    @health_points = health_points
    @attack_power = attack_power
  end

  def attack!(enemy)
    enemy.damage(attack_power)
  end

  def damage(amount)
    @health_points -= amount
  end

  def dead?
    health_points < 1
  end

  def can_attack?(enemy)
    return false if self.dead?
    return false if enemy.dead?
  end

end