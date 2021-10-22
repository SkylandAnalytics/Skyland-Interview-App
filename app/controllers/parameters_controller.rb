class ParametersController < ApplicationController
  def new
    @process_step_id = params[:process_step_id]
  end

  def create
    process_step = ProcessStep.find(params[:process_step_id])

    if process_step.parameters.last.nil?
      parameter = Parameter.create(measurement: params[:measurement].to_f, process_step_id: process_step.id)

      if parameter.save
        redirect_to "/process_steps/#{process_step.id}"
      else
        render :new
      end

    elsif params[:measurement].to_f > process_step.parameters.last.measurement.to_i
      parameter = Parameter.create(measurement: params[:measurement].to_f, process_step_id: process_step.id)

      if parameter.save
        redirect_to "/process_steps/#{process_step.id}"
      end

    else
      render :new
      flash[:error] = "Measurement must be greater than #{process_step.parameters.last.measurement}"
    end
  end

  def destroy
    parameter = Parameter.find(params[:id])
    parameter.delete
    redirect_to "/process_steps/#{params[:process_step_id]}/parameters"
end
