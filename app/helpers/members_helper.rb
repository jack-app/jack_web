module MembersHelper
  def gravatar_for(user, options = {size: 100, class:''})
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{options[:size]}"
    image_tag(gravatar_url, alt: user.name, class: options[:class])
  end
end
