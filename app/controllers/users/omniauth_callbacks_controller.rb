class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  # Method called when we come back from facebook
  def facebook
    user = User.find_for_facebook_oauth(request.env['omniauth.auth'])

    if user.persisted?
      sign_in_and_redirect user, event: :authentication
      set_flash_message(:notice, :success, kind: 'Facebook') if is_navigational_format?
    else
      session['devise.facebook_data'] = request.env['omniauth.auth']
      # If the user refuses to sign up with facebook,
      # we redirect him to our Devise sign up page
      redirect_to new_user_registration_url
    end
  end
end
