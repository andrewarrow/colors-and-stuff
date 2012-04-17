ColorsAndStuff::Application.routes.draw do
  root :to => 'welcome#index'

  match '/colors' => 'colors#change'
end
