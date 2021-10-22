class ParametersController < ApplicationController
  before_action :find_process_step, only: [:index, :new, :create, :edit]
  before_action :find_parameter, only: [:update, :destroy, :edit]

  def index
    @parameters = @process_step.parameters
  end

  def new
    @parameter = Parameter.new
  end

  def create
    error_route = "/process_steps/#{@process_step.id}/parameters/new"
    success_route = "/process_steps/#{@process_step.id}"

    if @process_step.no_params?
      parameter = @process_step.parameters.create(parameter_params)

      if parameter.save
        redirect_to success_route
      else
        redirect_to error_route
        flash[:error] = parameter.errors.full_messages.join(', ')
      end

    elsif @process_step.measurement_less_than_last?(params[:measurement])
      parameter = @process_step.parameters.create(parameter_params)

      if parameter.save
        redirect_to success_route
      end

    else
      redirect_to error_route
      flash[:error] = "Measurement must be less than #{@process_step.last_measurement}"
    end
  end

  def edit
  end

  def update
    @process_step_id = @parameter.process_step.id

    if @parameter.update(parameter_params)
      redirect_to "/process_steps/#{@process_step_id}/parameters"
    else
      render :edit
      flash[:alert] = "Error: #{@parameter.errors.full_messages}"
    end
  end

  def destroy
    @parameter.destroy

    respond_to do |format|
      format.js
      format.html {
    redirect_to "/process_steps/#{params[:process_step_id]}/parameters"
    }
    end
  end

  private

  def parameter_params
    params.require(:parameter).permit(:measurement)
  end

  def find_process_step
    @process_step = ProcessStep.find(params[:process_step_id])
  end

  def find_parameter
    @parameter = Parameter.find(params[:id])
  end
end
