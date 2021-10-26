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
    if
    else
      @process_step.save
    end

    redirect_to process_steps_path
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
