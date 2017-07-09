Rottenpotatoes::Application.routes.draw do
  resources :movies do
    # map '/' to be a redirect to '/movies'
    root :to => redirect('/movies')
    get "directorview"
  end
end
