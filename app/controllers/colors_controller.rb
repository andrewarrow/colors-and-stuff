class ColorsController < ApplicationController

  def change
    # @grayDarker:            #222;  13, 13, 13
    # @grayDark:              #333;  20, 20, 20
    # @grayLight:             #999;  60, 60, 60
    #
    # @navbarBackground:     @grayDarker;
    # @navbarBackgroundHighlight:       @grayDark;
    # @navbarText:                      @grayLight;
    # @navbarLinkColor:                 @grayLight;
    # @navbarLinkColorHover:            @white;

    color = Color.random
    buffer = []
    open('../bootstrap/less/variables.less').each do |line|
      tokens = line.split(':')
      if tokens.first == '@navbarBackground'
        buffer << "#{tokens.first}:     darken(#{color}, 20%);\n"
      elsif tokens.first == '@navbarBackgroundHighlight'
        buffer << "#{tokens.first}:     #{color};\n"
      elsif tokens.first == '@navbarText'
        buffer << "#{tokens.first}:     lighten(#{color}, 20%);\n"
      elsif tokens.first == '@navbarLinkColor'
        buffer << "#{tokens.first}:     lighten(#{color}, 20%);\n"
      else
        buffer << line
      end
    end
    open('../bootstrap/less/variables.less', "w") do |f|
      f << buffer.join
    end
    system('lessc ../bootstrap/less/bootstrap.less > app/assets/stylesheets/bootstrap.css')
    redirect_to root_url
  end

end
