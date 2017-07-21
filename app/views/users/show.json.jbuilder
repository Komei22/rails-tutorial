json.extract! @user, :id, :name, :microposts
json.follower do
  json.array! @user.followers do |follower|
    json.id follower.id
    json.name follower.name
  end
end

json.following do
  json.array! @user.following do |following|
    json.id following.id
    json.name following.name
  end
end
