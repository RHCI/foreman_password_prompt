class ApplicationController < ::ApplicationController

    before_filter :change_password

    def change_password
        puts "YYY We need to change passwords"
    end
end
