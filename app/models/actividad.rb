# encoding: UTF-8

class Actividad < ActiveRecord::Base
	include Sip::Modelo
  include Sip::Localizacion

  def presenta_nombre
    "#{id}"
  end
end
