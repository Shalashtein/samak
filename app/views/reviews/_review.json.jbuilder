json.extract! review, :id, :content, :rating, :reviewer_id, :fisherman_id, :created_at, :updated_at
json.url review_url(review, format: :json)
