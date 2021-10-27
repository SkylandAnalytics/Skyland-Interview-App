class ParametersController < ApplicationController
  def index
    @parameters = Parameter.all
  end

  def show
    @parameter = Parameter.find(params[:id])
  end

  def new; end

  def create
    process_step_id = params[:process_step_id]

    if maximum_measurement_threshold(process_step_id) > params[:measurement].to_f
      @parameter = Parameter.create(process_step_id: process_step_id, measurement: params[:measurement])
    else
      flash[:error] = 'Check measurement threshold guidelines'
    end
    redirect_to process_steps_path
  end

  def update; end

  def destroy; end

  private

  def parameters_params
    params.require(:parameter).permit(:measurement)
  end

  def maximum_measurement_threshold(process_step_id)
    corresponding_process_step = ProcessStep.find_by(id: process_step_id)

    highest_existing_parameter = corresponding_process_step.parameters.max_by(&:measurement)

    highest_existing_parameter.measurement
  end
end
