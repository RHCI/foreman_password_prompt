module ForemanPasswordPrompt

  # Example: Plugin's HostsController inherits from Foreman's HostsController
  class HostsController < ::HostsController

    # change layout if needed
    # layout 'foreman_password_prompt/layouts/new_layout'

    def new_action
      # automatically renders view/foreman_password_prompt/hosts/new_action
      puts "New action called"
      puts params[:new_password]
      puts params[:confirm_password]

      if params[:new_password] == params[:confirm_password]
          puts "Changing password"
      elsif
          puts "Passwords are not the same"
      end
    end

  end
end
