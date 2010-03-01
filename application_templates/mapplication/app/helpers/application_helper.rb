# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  
  def tabs
    tabs = ""
    @layers.each do |layer_hash|
      tabs += (session[:selected_tab].to_i == layer_hash[:id].to_i) ? ("<li class = 'selected_tab'><a href = '/layers/list/#{layer_hash[:id]}'>#{Layer.get_name(layer_hash[:layer].table_name)}</a></li>") : ("<li><a href = '/layers/list/#{layer_hash[:id]}'>#{Layer.get_name(layer_hash[:layer].table_name)}</a></li>")
    end
    return tabs
  end
  
end
