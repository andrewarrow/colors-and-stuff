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

=begin

@btnDangerBackground:               #ee5f5b;
@btnDangerBackgroundHighlight:      #bd362f;

=end

    color = Color.random
    infoColor = Color.random
    successColor = Color.random
    warningColor = Color.random
    dangerColor = Color.random

    buffer = []
    open('../bootstrap/less/variables.less').each do |line|
      tokens = line.split(':')
      if tokens.first == '@navbarBackground'
        buffer << "#{tokens.first}:     darken(#{color}, 15%);\n"
      elsif tokens.first == '@navbarBackgroundHighlight'
        buffer << "#{tokens.first}:     #{color};\n"
      elsif tokens.first == '@navbarText'
        buffer << "#{tokens.first}:     lighten(#{color}, 30%);\n"
      elsif tokens.first == '@navbarLinkColor'
        buffer << "#{tokens.first}:     lighten(#{color}, 30%);\n"
      elsif tokens.first == '@linkColor'
        buffer << "#{tokens.first}:     #{color};\n"

      elsif tokens.first == '@btnInfoBackground'
        buffer << "#{tokens.first}:     lighten(#{infoColor}, 15%);\n"
      elsif tokens.first == '@btnInfoBackgroundHighlight'
        buffer << "#{tokens.first}:     #{infoColor};\n"

      elsif tokens.first == '@btnSuccessBackground'
        buffer << "#{tokens.first}:     lighten(#{successColor}, 15%);\n"
      elsif tokens.first == '@btnSuccessBackgroundHighlight'
        buffer << "#{tokens.first}:     #{successColor};\n"

      elsif tokens.first == '@btnWarningBackground'
        buffer << "#{tokens.first}:     lighten(#{warningColor}, 15%);\n"
      elsif tokens.first == '@btnWarningBackgroundHighlight'
        buffer << "#{tokens.first}:     #{warningColor};\n"

      elsif tokens.first == '@btnDangerBackground'
        buffer << "#{tokens.first}:     lighten(#{dangerColor}, 15%);\n"
      elsif tokens.first == '@btnDangerBackgroundHighlight'
        buffer << "#{tokens.first}:     #{dangerColor};\n"

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
