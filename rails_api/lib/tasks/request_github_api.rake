namespace :request_github_api do
  task :search, ['keyword'] do |task, input|
    @res = open("https://api.github.com/search/repositories?q=#{input.keyword}")
    if @res.status[0] == "200"
      pp JSON.parse(@res.read)
    else
      raise "request error"
    end

    # ↑と同じ結果
    # バッククオート 外部コマンドでググる
    # @res = `curl -s "https://api.github.com/search/repositories?q=#{input.keyword}"`
    # p JSON.parse(@res)

  end
end

__END__
```
# task実行方法
$ bundle exec rake request_github_api:search['hoge']
```
