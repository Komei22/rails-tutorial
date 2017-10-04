json.extract! @user, :id, :name
json.img_url gravatar_url(@user)
