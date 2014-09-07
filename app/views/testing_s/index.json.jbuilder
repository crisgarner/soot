json.array!(@testing_s) do |testing_|
  json.extract! testing_, :id
  json.url testing__url(testing_, format: :json)
end
