json.array!(@trends) do |trend|
  json.extract! trend, :id, :noun, :count
  json.url trend_url(trend, format: :json)
end
