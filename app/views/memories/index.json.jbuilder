json.array!(@memories) do |memory|
  json.extract! memory, :id, :mood, :stress
  json.url memory_url(memory, format: :json)
end
