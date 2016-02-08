# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

user1 = User.create({ name: 'Buster', password: 'derpy_tongue', city: 'SF' })
user2 = User.create({name: 'KJ', password: 'octo_bunny', city: 'Oakland'})

pugs = Sub.create({ name: 'pugs', description: 'Living the puglyfe', moderator: user1 })
aww = Sub.create({ name: 'aww', description: 'For cute & cuddly',moderator: user2 })

pug_posts = Post.create([
    { title: 'Time for bed Thor', url:'http://i.imgur.com/uKm7HyT.jpg', user_id: 1},
    { title: 'Caught Snuggling', url:'http://i.imgur.com/Zx7PS41.jpg', user_id: 1},
    { title: 'Chewy Chubbs', url:'http://i.imgur.com/z27VWPO.jpg', user_id: 2},
    { title: 'How do I quiet him?', content: 'Seriously. How?', user_id: 2}
])

aww_posts = Post.create([
    { title: 'Cat bomb', url:'http://i.imgur.com/P4Cy136.jpg', user_id: 1},
    { title: 'So Peaceful', url:'http://i.imgur.com/xk2yaGH.jpg', user_id: 1},
    { title: 'Back Off', url:'http://i.imgur.com/dxwpdw8.jpg', user_id: 2},
    { title: 'Adopt a giant bunny', content: 'Only 5 months old', user_id: 2}
])

pug_posts.each do |pug_post|
  PostSub.create({post_id: pug_post.id, sub_id: pugs.id})
end

aww_posts.each do |aww_post|
  PostSub.create({post_id: aww_post.id, sub_id: aww.id})
end



