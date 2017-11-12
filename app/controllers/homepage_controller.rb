class HomepageController < ApplicationController


  def index
      def index
        @users = User.where(activated: true)
      end
    end
end
