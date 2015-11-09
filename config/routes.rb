Sage::Application.routes.draw do
  devise_for :users, controllers: { :omniauth_callbacks => "omniauth_callbacks" }
	get "pages/index"
	get "pages/show"
	get 'entame/entame_view'
	get 'economy/economy_view'
	get 'anime/anime_view'
	get 'game/game_view'
	get 'tour/tour_view'
	get 'gourmet/gourmet_view'
	get 'tech/tech_view'
	get 'life/life_view'
	get 'sports/sports_view'

	resources :trends
	resources :articles

	get 'graph_rader/status_view_rader' => 'browse#output'
	get 'graph_rader/status_view_rader/count' => 'graph_rader#status_view_rader'

	get 'graph/status_view'
	get 'sage/top'
	get 'sage/yourself'

	get 'anime/browse/input' => 'browse#input'
	get 'economy/economy_view/browse/input' => 'browse#input'
	get 'entame//entame_view/browse/input' => 'browse#input'
	get 'game/browse/input' => 'browse#input'
	get 'gourmet/browse/input' => 'browse#input'
	get 'life/browse/input' => 'browse#input'
	get 'sports/sports_view/browse/input' => 'browse#input'
	get 'tech/browse/input' => 'browse#input'
	get 'tour/browse/input' => 'browse#input'

	get 'sage/yourself/:id' => 'sage#yourself_update'
	get 'sage/keyword_update/:trends1/:trends2/:trends3/:trends4/:trends5' => 'sage#keyword_update'

	get 'mecab/nouncount/url' => 'mecab#nouncount'
	get 'mecab/output' => 'mecab#output'

	# sign up with twitter omniauth
	root 'pages#index'
	get 'pages/show'


end
