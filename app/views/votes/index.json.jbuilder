json.array!(@votes) do |vote|
  json.extract! vote, :grade, :best, :worst, :recommendation, :comment, :company, :user_id
  json.url vote_url(vote, format: :json)
end
