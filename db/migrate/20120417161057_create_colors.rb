class CreateColors < ActiveRecord::Migration

  def change
    # HSL HSV
    # Name,  Hex triplet, Red, Green, Blue, Hue, Satur, Light, Satur, Value, Shade Of
    # Kelly green #4CBB17 30% 73% 9%  101°  78% 41% 88% 73% Green  
    # Khaki (HTML/CSS) (Khaki)  #C3B091 76% 69% 57% 37° 29% 67% 26% 76% Green
    # Khaki (X11) (Light khaki) #F0E68C 94% 90% 55% 54° 77% 75% 42% 94% Green

    create_table :colors do |t|
      t.string  :name
      t.string  :w3c
      t.string  :hex

      t.integer :red
      t.integer :green
      t.integer :blue

      t.integer :hue

      t.integer :hsl_satur
      t.integer :hsl_light

      t.integer :hsv_satur
      t.integer :hsv_value

      t.string  :shade
    end

  end

end
