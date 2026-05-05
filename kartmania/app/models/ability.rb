# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(usuario)

    if usuario.is_a?(User) && usuario.admin?
      can :manage, :all

    elsif usuario.is_a?(User) && usuario.trabajador?
      can :manage, Cliente
      can :manage, Reserva
      can :manage, Participante
      can :manage, ClienteReserva
      can :read, Circuito
      can :manage, Kart
      can :read, Plan
      can :manage, Torneo
      can :read, User

    elsif usuario.is_a?(Cliente)
      can :read, Torneo
      can :participar, Torneo
      can :no_participar, Torneo
      can :read, Plan
      can :reservar, Plan

    else
      can :read, Plan
      can :reservar , Plan
    end
    
  end
end
