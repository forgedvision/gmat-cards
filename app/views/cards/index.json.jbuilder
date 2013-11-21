json.array!(@cards) do |card|
  json.extract! card, :term, :meaning, :done, :group_id
  json.url card_url(card, format: :json)
end
