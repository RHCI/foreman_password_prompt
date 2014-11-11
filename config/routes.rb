Rails.application.routes.draw do

  match 'new_action', :to => 'foreman_password_prompt/users#new_action'
  #root :to => 'users#new_action'

end
