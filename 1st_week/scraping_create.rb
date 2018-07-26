require './common'

url = 'https://gsacademy.tokyo/'

charset = nil
html = open(url) do |f|
  charset = f.charset # 文字種別を取得
  f.read # htmlを読み込んで変数htmlに渡す
end

doc = Nokogiri::HTML.parse(html, nil, charset)

doc.css(".item .body").each do |d|
  Headline.create(
    label: d.css(".label").text,
    title: d.css(".title").text
  )
end
