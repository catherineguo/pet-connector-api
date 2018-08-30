# frozen_string_literal: true

class ChecklistsController < ApplicationController
  before_action :set_checklist, only: %i[show update destroy]

  def index
    render json: Checklist.all
  end

  def show
    render json: @checklist
  end

  private

  def set_checklist
    @checklist = Checklist.find(params[:id])
  end

  def checklist_params
    params.require(:checklist).permit(:title, :start_date, :end_date, :pet_name, :instructions)
  end
end
