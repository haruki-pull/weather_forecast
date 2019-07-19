require "open-uri"
require "nokogiri"

url =  'https://tenki.jp/forecast/7/36/6610/33101/'

charset = nil
html = open(url) do |f|
    charset = f.charset
    f.read
end

doc = Nokogiri::HTML.parse(html,nil,charset)


day = doc.css(".left-style").text.slice(/\d月\d+日/)
place = doc.css("#main-column > section > h2").text.slice(/.+の天気/)
weather = doc.css("#main-column > section > div.forecast-days-wrap.clearfix > section.today-weather > div.weather-wrap.clearfix > div.weather-icon > p").inner_text

puts "#{day}の#{place}は#{weather}です！"
