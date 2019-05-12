module ControllerMacros
  def login_admin(admin)
    @request.env['devise.mapping'] = Devise.mappings[:admin]
    sign_in admin
  end

  def login_member(member)
    allow(controller).to receive(:authenticate_member!).and_return(member)
    @request.env['devise.mapping'] = Devise.mappings[:member]
    sign_in member
  end
end
