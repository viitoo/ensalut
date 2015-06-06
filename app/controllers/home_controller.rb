class HomeController < ApplicationController
  require 'rss'
  layout "home"
  def index 
	@rss =RSS::Parser.parse('https://espainetsalut.wordpress.com/feed/', false)
	@slide = Configuracion.all
	@eventos = Evento.where('fecha > ?', Date.today).order(:fecha)

  end
end
