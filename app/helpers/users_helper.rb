module UsersHelper
  # 引数で与えられたユーザのGravatarを返す
  def gravatar_for(user, size: 80)
    image_tag(gravatar_url(user), alt: user.name, class: "gravatar")
  end

  def gravatar_url(user, size: 80)
    id = Digest::MD5::hexdigest(user.email.downcase)
    "https://secure.gravatar.com/avatar/#{id}?s=#{size}"
  end
end
