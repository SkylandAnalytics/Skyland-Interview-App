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

  def edit
    @parameter = Parameter.find(params[:id])
  end

  def update
    @parameter = Parameter.find(params[:id])
    new_measurement = params[:parameter][:measurement].to_f

    if new_measurement < maximum_measurement_threshold(params[:process_step_id]) && new_measurement < 50.3 && new_measurement > -5.0
      @parameter.update(measurement: new_measurement)
      redirect_to process_steps_path
    else
      flash[:error] = 'Invalid new measurement'
      redirect_to edit_process_step_parameter_path
    end
  end

  def destroy
    @parameter = Parameter.find(params[:id])
    process_step = ProcessStep.find(params[:process_step_id])
    if process_step.parameters.count > 1
      @parameter.destroy
      redirect_to process_steps_path
    else
      flash[:error] = 'Process step must have at least one measurement'
      redirect_to edit_process_step_parameter_path
    end
  end

  private

  def maximum_measurement_threshold(process_step_id)
    corresponding_process_step = ProcessStep.find_by(id: process_step_id)

    highest_existing_parameter = corresponding_process_step.parameters.max_by(&:measurement)

    highest_existing_parameter.measurement
  end
end
