class BaseController < ApplicationController
  before_action :set_current_user

  attr_accessor :current_user

  private

  def set_current_user
    raise Pundit::NotAuthorizedError if request.headers['X-TOKEN-ID'].nil?

    @current_user = UserAssigner.new(request.headers['X-TOKEN-ID'])
  end
end
