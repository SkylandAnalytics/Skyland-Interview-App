class ProcessStepsController < ApplicationController
  def index
    @process_steps = ProcessStep.all
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
