Rails.application.routes.draw do
  resources :hero_preferences, except: [:new, :edit]
  resources :holidays, except: [:new, :edit]
  resources :hero_schedules, except: [:new, :edit]
  get 'hero_schedules/today', to: 'hero_schedules#today'

  resources :heroes, except: [:new, :edit]
  get 'heroes/today', to: 'heroes#today'

end
