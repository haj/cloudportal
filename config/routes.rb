Rails.application.routes.draw do
  get 'environments/index'

  get 'compute_instances/index'

  devise_for :users
	root "projects#index"

	resources :products do
		resources :cloud_components
		resources :oracle_database_components, controller: 'cloud_components', type: 'OracleDatabaseComponent'  
		namespace :oraclecloud do
			resources :database_configs
		end
	end
	resources :compute_instances
	resources :projects do
		resources :environments do
			resources :cloud_instances
			resources :oracle_cloud_database, controller: 'cloud_instances', type: 'OracleCloudDatabase'
		end
	end

	namespace :oraclecloud do
		resources :databases do
			put :backup
		end
	end

	resources :rate_cards
end
