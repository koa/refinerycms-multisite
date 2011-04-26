Refinery::Application.routes.draw do

  scope(:path => 'refinery', :as => 'admin', :module => 'admin') do
    resources :sites do
      resources :hostnames
    end
  end

end
