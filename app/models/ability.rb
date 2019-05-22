
class Ability < Sip::Ability

   def initialize(usuario = nil)
    # Define abilities for the passed in user here. For example:
    #
    #   user ||= User.new # guest user (not logged in)
    #   if user.admin?
    #     can :manage, :all
    #   else
    #     can :read, :all
    #   end
    #
    # The first argument to `can` is the action you are giving the user 
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on. 
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/ryanb/cancan/wiki/Defining-Abilities
	can :read, [Sip::Pais, Sip::Departamento, Sip::Municipio, Sip::Clase]
	# No se autorizan usuarios con fecha de deshabilitación
	if !usuario || usuario.fechadeshabilitacion
	      return
	end

	can :contar, Sip::Ubicacion
	can :buscar, Sip::Ubicacion
	can :lista, Sip::Ubicacion
	can :descarga_anexo, Sip::Anexo
	can :nuevo, Sip::Ubicacion
	if usuario && usuario.rol then
	  case usuario.rol 
	  when Ability::ROLANALI
	   can :read, Sip::Actorsocial
	   can :read, Sip::Persona
	   can :read, Sip::Ubicacion
	   can :new, Sip::Ubicacion
	   can [:update, :create, :destroy], Sip::Ubicacion
	  when Ability::ROLADMIN
	  can :manage, Sip::Actorsocial
	  can :manage, Sip::Persona
	  can :manage, Sip::Respaldo7z
	  can :manage, Sip::Ubicacion
	  can :manage, ::Usuario
	  can :manage, :tablasbasicas
	  self.tablasbasicas.each do |t|
	  c = Ability.tb_clase(t)
	  can :manage, c
	  end
	 end
       end
  end
end
