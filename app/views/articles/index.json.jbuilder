json.array!(@articles) do |article|
  json.extract! article, :id, :url, :genre, :count
  json.url article_url(article, format: :json)
end
