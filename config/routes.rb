Rails.application.routes.draw do

  match 'new_action', :to => 'foreman_password_prompt/hosts#new_action'

end
