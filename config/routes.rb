ColorsAndStuff::Application.routes.draw do
  root :to => 'welcome#index'

  match '/navbar' => 'navbar#change'
end
