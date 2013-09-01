module UsersHelper
  def avatar_for(user, size = :thumb)
    if size == :thumb
      return image_tag('avatar-thumb.png', class: 'img-thumbnail') if not user.avatar.exists?
      image_tag user.avatar.url(:thumb), class: 'img-thumbnail'
    else
      return image_tag('avatar-profile.png', class: 'img-thumbnail') if not user.avatar.exists?
      image_tag user.avatar.url(:profile), class: 'img-thumbnail'
    end
  end
end