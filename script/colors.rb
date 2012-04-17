require 'hpricot'

file = File.open('script/html_colors.html', 'r')
doc = Hpricot(file.read)
file.close

tables = doc.search("//table[@class='wikitable sortable']")

      #t.string  :shade

hash = {}
tables.search("//tr").each_with_index do |tr, i|
  ths = tr.search("//th")
  tds = tr.search("//td")
  next if tds[1].nil?

  color = Color.new

  color.name = ths[0].search("//a").inner_html.strip
  color.hex = tds[1].inner_html.strip

  color.red = tds[2].inner_html.strip
  color.green = tds[3].inner_html.strip
  color.blue = tds[4].inner_html.strip

  color.hue = tds[5].inner_html.strip.split('>').last

  color.hsl_satur = tds[6].inner_html.strip
  color.hsl_light = tds[7].inner_html.strip

  color.hsv_satur = tds[8].inner_html.strip
  color.hsv_value = tds[9].inner_html.strip

  color.w3c = tds[10].inner_html.strip
  color.w3c = nil if color.w3c == '&#160;'

  hash[color.name] = color
end

pp hash
