module ForemanPasswordPrompt

  # Example: Plugin's UsersController inherits from Foreman's UsersController
  class UsersController < ::UsersController
      include Foreman::Controller::UsersMixin

    #before_filter :change_password

    #def change_password
    # THIS WILL CONFLICT NOW that new_action has been renamed below
    #    puts "XXX We need to change passwords"
    #end

    # change layout if needed
    # layout 'foreman_password_prompt/layouts/new_layout'

    def change_password
      # automatically renders view/foreman_password_prompt/users/change_password
      puts "New action called"
      puts params[:new_password]
      puts params[:confirm_password]
      if User.current.nil?
          puts "User is null"
      elsif
          puts User.current.login
      end

      if params[:new_password] == params[:confirm_password]
          puts "Changing password"
          puts User.current.password
          puts User.current.password_hash
          User.current.password= params[:new_password]
          puts User.current.password
          puts User.current.password_hash
      elsif
          puts "Passwords are not the same"
      end

      User.current.save

    end

  end
end

