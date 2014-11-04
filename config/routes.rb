Rails.application.routes.draw do

  #root :to => 'users#new_action'
  match 'new_action', :to => 'foreman_password_prompt/users#new_action'

end
