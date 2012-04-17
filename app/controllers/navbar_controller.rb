class NavbarController < ApplicationController

  def change
    buffer = []
    open('../bootstrap/less/variables.less').each do |line|
      tokens = line.split(':')
      if tokens.first == '@navbarBackground'
        buffer << "#{tokens.first}:     #ca0088;\n"
      else
        buffer << line
      end
    end
    open('../bootstrap/less/variables.less', "w") do |f|
      f << buffer.join
    end
    redirect_to root_url
  end

end
