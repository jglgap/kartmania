class LandingController < ApplicationController
  def welcome
  end
  def nosotros
    @circuitos = Circuito.all.order(:nombre)
  end
end
