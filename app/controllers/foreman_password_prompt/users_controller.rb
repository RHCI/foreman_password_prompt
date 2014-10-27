module ForemanPasswordPrompt

  # Example: Plugin's UsersController inherits from Foreman's UsersController
  class UsersController < ::UsersController

    # change layout if needed
    # layout 'foreman_password_prompt/layouts/new_layout'

    def new_action
      # automatically renders view/foreman_password_prompt/users/new_action
      puts "New action called"
      puts params[:new_password]
      puts params[:confirm_password]

      if params[:new_password] == params[:confirm_password]
          puts "Changing password"
      elsif
          puts "Passwords are not the same"
      end

      # this breaks things
      #@user = find_resource(:edit_users)
      #if @user == nil
      #    puts @user.login
      #elsif
      #    puts "User is null"
      #end
    end

  end
end
