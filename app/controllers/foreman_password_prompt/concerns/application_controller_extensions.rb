module ForemanPasswordPrompt
  module Concerns
    module ApplicationControllerExtensions
      extend ActiveSupport::Concern

      included do
        before_filter :change_password
      end

      def change_password
        if User.current && (User.current.created_at >= User.current.updated_at)
          redirect_to change_password_path
        end
      end
    end
  end
end
