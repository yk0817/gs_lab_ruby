require './common'

url = 'https://gsacademy.tokyo/'

charset = nil
html = open(url) do |f|
  # status codeが返る。
  p f.status
  charset = f.charset # 文字種別を取得
  # charset表示
  # p charset
  f.read # htmlを読み込んで変数htmlに渡す
end

p html


doc = Nokogiri::HTML.parse(html, nil, charset)
# 扱いやすくなるように修正してもらえる

# ページ全体から抽出
# CSSセレクタで抽出、配列と同じように扱える
pp doc.css(".item").count
pp doc.css(".item")[0]

# text部分のみを抽出
# pp doc.css(".item")[0].text

# タイトルを抽出 見づらい。
# pp doc.css(".title").text

# そういうときはeachメソッドが便利
# doc.css(".title").each do |title|
#   pp title.text
# end

# 以下、もっと勉強したい人向け(2回目以降取り扱います)
__END__
# クラス
p doc.class
# 継承元
p doc.ancestors
