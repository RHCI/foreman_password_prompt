module ForemanPasswordPrompt
    module ApplicationControllerExtensions
        extend ActiveSupport::Concern

        included do
            alias_method_chain :login, :dynflow
            alias_method_chain :new_action, :dynflow
            #alias_method_chain :create, :dynflow
        end

        def login_with_dynflow
            puts "XXX login with dynflow called"
        end

        def new_action_with_dynflow
            puts "XXX new_action with dynflow called"
        end
    end
end
