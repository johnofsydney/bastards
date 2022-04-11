class ReligionsController < ApplicationController
  before_action :set_religion, only: %i[ show edit update destroy ]

  def index
    @religions = Religion.all
  end

  def show
    @candidates = @religion.candidates
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_religion
    @religion = Religion.find(params[:id])
  end
end