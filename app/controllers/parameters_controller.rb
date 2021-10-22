class ParametersController < ApplicationController
  def index
    @process_step = ProcessStep.find(params[:process_step_id])

    @parameters = @process_step.parameters
  end

  def new
    @process_step_id = params[:process_step_id]
  end

  def create
    process_step = ProcessStep.find(params[:process_step_id])
    error_route = "/process_steps/#{process_step.id}/parameters/new"
    success_route = "/process_steps/#{process_step.id}"

    if process_step.no_params?
      parameter = Parameter.create(parameter_params)

      if parameter.save
        redirect_to success_route
      else
        redirect_to error_route
        flash[:error] = parameter.errors.full_messages.join(', ')
      end

    elsif process_step.measurement_greater_than_last?(params[:measurement])
      parameter = Parameter.create(parameter_params)

      if parameter.save
        redirect_to success_route
      end

    else
      redirect_to error_route
      flash[:error] = "Measurement must be greater than #{process_step.parameters.last.measurement}"
    end
  end

  def destroy
    parameter = Parameter.find(params[:id])
    parameter.delete
    redirect_to "/process_steps/#{params[:process_step_id]}/parameters"
  end

  private

  def parameter_params
    params.permit(:measurement, :process_step_id)
  end
end
