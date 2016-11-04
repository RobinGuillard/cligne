json.array!(@blinks) do |blink|
  json.extract! blink, :id, :status, :date
  json.url blink_url(blink, format: :json)
end
