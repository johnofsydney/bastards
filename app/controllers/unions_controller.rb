class UnionsController < ApplicationController
  before_action :set_union, only: %i[ show edit update destroy ]

  # GET /unions or /unions.json
  def index
    @unions = Union.all
  end

  # GET /unions/1 or /unions/1.json
  def show
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_union
    @union = Union.find(params[:id])
  end
end
