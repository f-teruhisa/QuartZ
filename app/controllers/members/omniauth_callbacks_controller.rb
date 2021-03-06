# rubocop:disable Style/ClassAndModuleChildren
class Members::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
    callback_from :facebook
  end

  private

  def callback_from(provider)
    provider = provider.to_s

    @member = Member.find_for_oauth(request.env['omniauth.auth'])

    if @member.persisted?
      sign_in_and_redirect @member, event: :authentication
    else
      session["devise.#{provider}_data"] = request.env['omniauth.auth']
      redirect_to new_member_registration_url
    end
  end
end
# rubocop:enable Style/ClassAndModuleChildren
