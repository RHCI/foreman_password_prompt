module ForemanPasswordPrompt
    module ApplicationControllerExtensions
        extend ActiveSupport::Concern

        included do
            alias_method_chain :login, :dynflow
            alias_method_chain :change_password, :dynflow
            alias_method_chain :welcome, :dynflow
            #alias_method_chain :create, :dynflow
        end

        def login_with_dynflow
            puts "XXX login with dynflow called"
        end

        def change_password_with_dynflow
            puts "XXX change_password with dynflow called"
        end

        def welcome_with_dynflow
            puts "XXX welcome with dynflow called"
        end
    end
end
