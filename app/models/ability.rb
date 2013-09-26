class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    if user.has_role? :admin_ambiente
      can :criar, Loja
      can :excluir, Loja
      can :editar, Loja

      can :criar, Rito
      can :criar, Obediencia

    elsif user.has_role? :admin_loja
      can :editar, Loja do |loja|
        loja.users.include?(user)
      end

      can :criar, Loja do |loja|
        loja.users.include?(user)
      end

      can :criar_irmao, Loja do |loja|
        loja.users.include?(user)
      end

      can :editar_irmao, Loja do |loja|
        loja.users.include?(user)
      end

      can :desfiliar, Loja do |loja|
        loja.users.include?(user)
      end

      can :criar_evento, Loja do |loja|
        loja.users.include?(user)
      end

      can :editar_evento, Loja do |loja|
        loja.users.include?(user)
      end

      can :excluir_evento, Loja do |loja|
        loja.users.include?(user)
      end

      can :criar_dependente, Loja do |loja|
        loja.users.include?(user)
      end

      can :editar_dependente, Loja do |loja|
        loja.users.include?(user)
      end

      can :excluir_fotos, Loja do |loja|
        loja.users.include?(user)
      end

      can :excluir_peca, Loja do |loja|
        loja.users.include?(user)
      end
    elsif user.has_role? :admin_master
      can :criar, Loja
      can :excluir, Loja
      can :editar, Loja

      can :criar_irmao, Loja
      can :editar_irmao, Loja
      can :desfiliar, Loja

      can :excluir, Dependente
      can :criar, Dependente
      can :editar, Dependente

      can :criar_evento, Loja
      can :editar_evento, Loja
      can :excluir_evento, Loja

      can :excluir, Peca

      can :criar, Rito
      can :criar, Obediencia
    end
  end
end
