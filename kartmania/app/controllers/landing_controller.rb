class LandingController < ApplicationController
  def welcome
  end
  def our_karts
    @circuitos = Circuito.all.order(:nombre)
  end
end
