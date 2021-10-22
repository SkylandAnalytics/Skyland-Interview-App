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
    process_step = ProcessStep.create(process_step_params)

    if process_step.save
      redirect_to "/process_steps/#{process_step.id}/parameters/new"
    else
      flash[:error] = process_step.errors.full_messages.join(', ')
      render :new
    end
  end

  def edit
    @process_step = ProcessStep.find(params[:id])
  end

  def update
    @process_step = ProcessStep.find(params[:id])
    binding.pry
    if @process_step.update(process_step_params)
      redirect_to "/process_steps/#{@process_step.id}"
    else
      render :edit
      flash[:alert] = "Error: #{@process_step.errors.full_messages}"
    end
  end

  def destroy
    process_step = ProcessStep.find(params[:id])

    process_step.destroy

    redirect_to('/process_steps')
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
      params.require(:process_step).permit(:name, :position, :description)
    end
end
