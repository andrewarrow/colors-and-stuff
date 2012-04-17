class Color < ActiveRecord::Base

  def self.random
    colors = Color.all.to_a
    colors[rand(colors.size)].hex
  end

end
