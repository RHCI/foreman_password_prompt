class ApplicationController < ::ApplicationController

    before_filter :change_password

    private

    def change_password
        puts "YYY We need to change passwords"
        redirect_to(:new_action)
    end
end
