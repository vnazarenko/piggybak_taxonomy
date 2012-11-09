PiggybakTaxonomy::Engine.routes.draw do
  match "/n/*path" => "navigation#show"
end
