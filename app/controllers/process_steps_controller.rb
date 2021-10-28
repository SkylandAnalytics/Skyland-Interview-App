class ProcessStepsController < ApplicationController
  def index
    @process_steps = ProcessStep.all
  end

  def show
    @process_step = ProcessStep.find(params[:id])
  end

  def new
    @process_step = ProcessStep.new
  end

  def create
    @process_step = ProcessStep.new(process_step_params)
    @parameter = Parameter.create(process_step_id: @process_step.id, measurement: params[:process_step][:measurement])
    @process_step.parameters << @parameter if parameter_validator(@parameter)

    if parameter_validator(@parameter) && !@process_step.name.present?
      flash[:error] = 'Please add at least a name'
      redirect_to new_process_step_path

    elsif  process_step_filled_out(@process_step) && params[:process_step][:measurement].empty?
        flash[:error] = 'You must fill in measurements'
        redirect_to new_process_step_path

    elsif process_step_filled_out(@process_step) && !parameter_validator(@parameter)
      flash[:error] = 'Wrong or missing measurement parameter'
      redirect_to new_process_step_path

    elsif !parameter_validator(@parameter)
      flash[:error] = 'Wrong or missing measurement parameter'
      redirect_to new_process_step_path
    else
      @process_step.save
      redirect_to process_steps_path
    end
  end

  def edit
    @process_step = ProcessStep.find(params[:id])
  end

  def update
    @process_step = ProcessStep.find(params[:id])
    @process_step.update(process_step_params)

    redirect_to process_steps_path
  end

  def destroy
    @process_step = ProcessStep.find(params[:id])
    @process_step.destroy

    respond_to do |format|
      format.html { redirect_to process_steps_path }
      format.json { head :no_content }
      format.js   { render layout: false }
    end
  end

  def frontend
    @process_steps = ProcessStep.all
    respond_to do |format|
      format.js do
        render :frontend
      end
      format.html
    end
  end

  private

  def process_step_params
    params.require(:process_step).permit(:name, :description, :position)
  end

  def parameter_validator(parameter)
    !parameter.measurement.nil? && parameter.measurement > -5.0 && parameter.measurement < 50.3 ? true : false
  end

  def process_step_filled_out(process_step)
    process_step.name.present? && process_step.description.present? && process_step.position.present?
  end
end
