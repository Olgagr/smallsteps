class Auth::OmniauthCallbacksController < Devise::OmniauthCallbacksController

  def facebook
    find_for_provider_oauth('facebook')
  end

  def twitter
    find_for_provider_oauth('twitter')
  end

  private

  def find_for_provider_oauth(provider)
    @auth = request.env['omniauth.auth']
    user = User.where(:provider => @auth.provider, :uid => @auth.uid).first
    unless user
      user = self.send("create_#{provider}_user")
    end

    if user.persisted?
      sign_in_and_redirect user, event: :authentication
      # TODO set some flash message
    else
      self.send("session_#{provider}_data")
      redirect_to new_user_registration_url
    end
  end

  def create_facebook_user
    User.create(
        provider: @auth.provider,
        uid: @auth.uid,
        username: @auth.info.email,
        password: Devise.friendly_token[0, 20]
    )
  end

  def session_facebook_data
    session["devise.facebook_data"] = request.env['omniauth.auth']
  end

  def create_twitter_user
    User.create(
        provider: @auth.provider,
        uid: @auth.uid,
        username: @auth.info.name,
        password: Devise.friendly_token[0, 20]
    )
  end

  def session_twitter_data
    session["devise.twitter_data"] = env["omniauth.auth"].except("extra")
  end

end