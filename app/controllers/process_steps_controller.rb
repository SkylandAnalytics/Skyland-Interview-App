class ProcessStepsController < ApplicationController
  def index
    @process_steps = ProcessStep.all
  end

  def show
  end

  def new
    @process_step = ProcessStep.new
  end

  def create
    @process_step = ProcessStep.create(process_step_params)

    if process_step_params[:name].empty? || process_step_params[:description].empty? || process_step_params[:position].empty? || process_step_params[:measurement].empty?
      flash[:alert] = "Please fill in all the fields"
      redirect_to new_process_step_path
    else
      @process_step.save
      redirect_to process_steps_path
    end

  end

  def update
  end

  def destroy
  end

  def frontend
    @process_steps = ProcessStep.all
    respond_to do |format|
      format.js {
        render :frontend
      }
      format.html
    end
  end

  private

  def process_step_params
    params.require(:process_step).permit(:name, :description, :position)
  end
end
