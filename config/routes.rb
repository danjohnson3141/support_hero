Rails.application.routes.draw do
  resources :hero_preferences, except: [:new, :edit]
  get 'hero_preferences/hero/:id', to: 'hero_preferences#hero'
  resources :holidays, except: [:new, :edit]
  get 'holidays/year/:year', to: 'holidays#year'
  resources :hero_schedules, except: [:new, :edit]
  get 'hero_schedules/current/:unit_of_time', to: 'hero_schedules#current'

  resources :heroes, except: [:new, :edit]
  get 'heroes/today', to: 'heroes#today'

end
