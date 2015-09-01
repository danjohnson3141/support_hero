Rails.application.routes.draw do
  resources :holidays, except: [:new, :edit]
  resources :hero_schedules
  get 'hero_schedules/today', to: 'hero_schedules#today'

  resources :heroes
  get 'heroes/today', to: 'heroes#today'

end
