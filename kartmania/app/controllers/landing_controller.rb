class LandingController < ApplicationController

  layout "landing"

  def welcome
  end
  def nosotros
    @circuitos = Circuito.all.order(:nombre)
  end
end
