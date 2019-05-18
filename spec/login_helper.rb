# Rspec helper of member login
RSpec.shared_context 'logged_in' do
  let(:member) { create(:member) }
  before do
    controller.instance_variable_set(:@member, member)
    session['member_id'] = member.id
    login_member member
  end
end
