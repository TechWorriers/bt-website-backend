class UserAssigner
  attr_accessor :token, :user

  def initialize(token)
    @token = token
  end

  def decode
    @user = User.find_by(authentication_token: token)
  rescue NoMethodError
    { error: 'User not found' }.to_json
  end
end
