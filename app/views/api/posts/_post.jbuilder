json.extract! post, :id, :title, :url, :content, :created_at, :updated_at
json.comments post.comments, partial: 'api/comments/comment', as: :comments

json.author do
  json.author_name post.author.name
  json.author_city post.author.city
end