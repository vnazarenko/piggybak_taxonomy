PiggybakTaxonomy::Engine.routes.draw do
  match "/n/*path" => "navigation#show", :as => :piggybak_taxonomy
end
