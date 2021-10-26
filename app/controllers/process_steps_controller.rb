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
    @process_step = ProcessStep.new(process_step_params)
    @process_step.parameters << Parameter.create(process_step_id: @process_step.id, measurement: params[:process_step][:measurement])

    if params[:process_step][:measurement].empty?
      flash[:error] = "Measurement must be present"
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
