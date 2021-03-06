# frozen_string_literal: true

class ChecklistsController < ProtectedController
  before_action :set_checklist, only: %i[show update destroy]

  def index
    render json: current_user.checklists.all
  end

  def show
    render json: @checklist
  end

  def destroy
    @checklist.destroy
    head :no_content
  end

  def update
    if @checklist.update(checklist_params)
      render json: @checklist
    else
      render json: @checklist.errors, status: :unprocessable_entity
    end
  end

  def create
    @checklist = current_user.checklists.build(checklist_params)

    if @checklist.save
      render json: @checklist, status: :created
    else
      render json: @checklist.errors, status: :unprocessable_entity
    end
  end

  private

  def set_checklist
    @checklist = current_user.checklists.find(params[:id])
  end

  def checklist_params
    params.require(:checklist).permit(:title, :start_date, :end_date, :pet_name, :instructions)
  end
end
