require './common'

url = 'https://gsacademy.tokyo/'

charset = nil
html = open(url) do |f|
  # status codeが返る。
  p f.status
  charset = f.charset # 文字種別を取得
  f.read # htmlを読み込んで変数htmlに渡す
end
