class ProcessStepsController < ApplicationController
  def index
    @process_steps = ProcessStep.all
  end

  def show
    @process_step = ProcessStep.find(params[:id])
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
end
