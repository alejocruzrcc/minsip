# encoding: UTF-8

class ActividadesController < Sip::ModelosController
  helper ::ApplicationHelper

  before_action :set_actividad, 
    only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource  class: ::Actividad

  def clase 
    "::Actividad"
  end

  def atributos_index
    [
      "id"
    ]
  end

  def atributos_form
    [
      "id"
    ]
  end

  def index_reordenar(registros)
    return registros.reorder(:id)
  end

  def new_modelo_path(o)
    return new_actividad_path()
  end

  def genclase
    return 'F'
  end


  private

  def set_actividad
    @registro = @actividad = ::Actividad.find(
      ::Actividad.connection.quote_string(params[:id]).to_i
    )
  end

  # No confiar parametros a Internet, sólo permitir lista blanca
  def actividad_params
    params.require(:actividad).permit(*atributos_form)
  end

end
