json.array!(@clignes) do |cligne|
  json.extract! cligne, :id, :status, :date
  json.url cligne_url(cligne, format: :json)
end
