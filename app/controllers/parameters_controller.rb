class ParametersController < ApplicationController

  def index
    @parameters = Parameter.all
  end

  def show
    @parameter = Parameter.find(params[:id])
  end

  def new

  end

  def create
    @parameter = Parameter.create(process_step_id: params[:process_step_id], measurement: params[:measurement])

    @parameter.save

    redirect_to process_steps_path
  end

  def update
  end

  def destroy
  end

  private

  def parameters_params
    params.require(:parameter).permit(:measurement)
  end
end
