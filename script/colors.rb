require 'hpricot'

file = File.open('script/colors.html', 'r')
doc = Hpricot(file.read)
file.close

tables = doc.search("//table")

tables.search("//tr").each_with_index do |tr, i|
  pp tr
  #tds = tr.search("//td")
  #ip = tds[1].search("//span")[0].inner_html
  #port = tds[2].inner_html.strip.to_i
end
