json.extract! comment, :body, :created_at
json.comments comment.child_comments, partial: 'api/comments/comment', as: :comments

json.author do
  json.author_name comment.author.name
end