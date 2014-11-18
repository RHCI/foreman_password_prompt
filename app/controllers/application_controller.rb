class ApplicationController < ::ApplicationController

    before_filter :should_change_password

    private

    def should_change_password
        puts "YYY We need to change passwords"
        redirect_to(:change_password)
    end
end
