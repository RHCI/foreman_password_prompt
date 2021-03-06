require 'deface'

module ForemanPasswordPrompt
  class Engine < ::Rails::Engine

    config.autoload_paths += Dir["#{config.root}/app/controllers/concerns"]
    config.autoload_paths += Dir["#{config.root}/app/helpers/concerns"]
    config.autoload_paths += Dir["#{config.root}/app/models/concerns"]
    config.autoload_paths += Dir["#{config.root}/app/overrides"]

    # Add any db migrations
    initializer "foreman_password_prompt.load_app_instance_data" do |app|
      app.config.paths['db/migrate'] += ForemanPasswordPrompt::Engine.paths['db/migrate'].existent
    end

    initializer 'foreman_password_prompt.register_plugin', :after=> :finisher_hook do |app|
      Foreman::Plugin.register :foreman_password_prompt do
        requires_foreman '>= 1.4'

        # Add permissions
        security_block :foreman_password_prompt do
          permission :view_foreman_password_prompt, {:'foreman_password_prompt/users' => [:change_password] }
        end

        # Add a new role called 'Discovery' if it doesn't exist
        role "ForemanPasswordPrompt", [:view_foreman_password_prompt]

        #add menu entry
        menu :admin_menu, :template,
             :url_hash => {:controller => :'foreman_password_prompt/users', :action => :change_password },
             #:caption  => 'ForemanPasswordPrompt',
             :caption  => 'Change Password',
             :parent   => :administer_menu,
             :after    => :users

        # add dashboard widget
        widget 'foreman_password_prompt_widget', :name=>N_('Foreman plugin template widget'), :sizex => 4, :sizey =>1
      end
    end

    #Include concerns in this config.to_prepare block
    config.to_prepare do
      begin
        puts "XXX preparing config"
        #User::Managed.send(:include, ForemanPasswordPrompt::UserExtensions)
        # XXX: suggestion from joseph, comment out User and add Controller.send
        puts "XXX Calling Controller.send"
        ::ApplicationController.send(:include, ForemanPasswordPrompt::Concerns::ApplicationControllerExtensions)
        puts "XXX Calling UsersHelper.send"
        UsersHelper.send(:include, ForemanPasswordPrompt::UsersHelperExtensions)
      rescue => e
        puts "XXX ugh is this really a problem?"
        puts "ForemanPasswordPrompt: skipping engine hook (#{e.to_s})"
      end
    end

    rake_tasks do
      Rake::Task['db:seed'].enhance do
        ForemanPasswordPrompt::Engine.load_seed
      end
    end

  end
end
