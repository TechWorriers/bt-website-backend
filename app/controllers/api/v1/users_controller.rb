module Api
  module V1
    class UsersController < BaseController
      def show
        @user = Profile.find_by(ref_id: current_user.uuid)
      end
    end
  end
end
