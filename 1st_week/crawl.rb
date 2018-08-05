require './common.rb'

class Crawl
  def initialize(url, name)
    @school_url = url
    SchoolBlog.find_or_create_by(
      url: url,
      name: name
    )
  end

  def save_contents
    save_ary = []
    parse_headlines.each do |url, headline|
      # いらないものは含めない
      next if url.match(/qiita/)
      next unless url.include?('html')
      # 保存
      ActiveRecord::Base.transaction do
        headline.save
        @article = parse_article(headline, url)
        @article.save
      end
      sleep 1
    end
  end

  private

    def parse_article(headline, url)
      doc = open_html(url)
      headline.build_article(contents: doc.css('#contents').text)
    end

    def parse_headlines
      parse_headlines = []
      top_doc = open_html(@school_url)
      top_doc.css('article .item').each do |article|
        @headline = SchoolBlog.find_by(url: @school_url).headlines.build
        @headline.label, @headline.title  = article.css(".label").text, article.css(".title").text
        parse_headlines << [article.css("a").first[:href], @headline]
      end
      parse_headlines
    end

    def open_html(url)
      html = open(url) do |f|
        f.read
      end
      Nokogiri::HTML.parse(html, nil, 'UTF-8')
    end
end

@crawl = Crawl.new("https://gsacademy.tokyo/", "gsacademy")
@crawl.save_contents
