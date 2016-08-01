module UsersHelper

  def avatar_for user, options = {}
    size = Settings.users.image_size
    image_tag user.avatar, alt: user.name, class: "img-thumbnail", width: "size",
      height: "size", class: "avatar_user"
  end
end
