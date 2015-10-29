Sage::Application.routes.draw do
  get 'browse/input'
  get 'browse/output'
  get 'mecab/nouncount'
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
  get 'graph_rader/status_view_rader'
  get 'graph/status_view'
  get 'sage/top'
  get 'sage/entame'
  get 'sage/yourself'

  get 'anime/browse/input' => 'browse#input'
  get 'economy/browse/input' => 'browse#input'
  get 'entame/browse/input' => 'browse#input'
  get 'game/browse/input' => 'browse#input'
  get 'gourmet/browse/input' => 'browse#input'
  get 'life/browse/input' => 'browse#input'
  get 'sports/browse/input' => 'browse#input'
  get 'tech/browse/input' => 'browse#input'
  get 'tour/browse/input' => 'browse#input'
  get 'sage/yourself/:id' => 'sage#yourself_update'
end
