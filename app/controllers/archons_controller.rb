class ArchonsController < ApplicationController

  # GET lodges/:lodge_id/archons
  def index
    @lodge = Lodge.find params[:lodge_id]
    render json: @lodge.archons
  end

  # GET lodges/:lodge_id/archons/:id
  def show
    @lodge = Lodge.find params[:lodge_id]
    render json: @lodge.archons.find(params[:id])
  end

  # POST lodges/:lodge_id/archons/
  def create
    @archon_hash = import params[:archon]['import_link']
  end

  # DELETE lodges/:lodge_id/archons/:id
  def delete
    @lodge = Lodge.find params[:lodge_id]
    @lodge.archons.find(params[:id]).destroy
  end

  def import (import_link)
    if import_link.include? 'https://www.keyforgegame.com/deck-details/'
      import_link.slice! 'https://www.keyforgegame.com/deck-details/'
      ImportArchon.call(import_link)
    end
  end

  def import_params
    params.permit(:import_link)
  end
end
