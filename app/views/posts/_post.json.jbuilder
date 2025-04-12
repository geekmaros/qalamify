json.extract! post, :id, :title, :body, :slug, :status, :user_id, :published_at, :reading_time, :summary, :created_at, :updated_at
json.url post_url(post, format: :json)
