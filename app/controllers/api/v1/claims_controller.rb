module API
  module V1
    class ClaimsController < ActionController::Base
      def today
        render json: User.claiming_today
      end
    end
  end
end
