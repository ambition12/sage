Sage::Application.routes.draw do

  get "browse/input"
  get "mecab/nouncount"
  get "entame/entame_view"
  resources :trends
  resources :articles
  get "graph_rader/status_view_rader"
  get "graph/status_view"
  get "sage/top"
  get "sage/entame"
  get "sage/yourself"
end
