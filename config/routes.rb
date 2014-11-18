Rails.application.routes.draw do

  match 'change_password', :to => 'foreman_password_prompt/users#change_password'
  #root :to => 'users#change_password'

end
