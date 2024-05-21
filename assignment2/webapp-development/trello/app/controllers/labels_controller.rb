class LabelsController < ApplicationController
  def new
    @label = Label.new(board_id: params[:board_id])
  end

  def create
    @label = Label.new(label_params)
    if @label.save!
      redirect_to board_path(@label.board_id)
    else
      render :new
    end
  end

	def edit
		@label = Label.find(params[:id])
	end

	def update
		@label = Label.find(params[:id])
		if @label.update label_params
				redirect_to board_path(@label.board_id)
		else
				render :edit
		end
	end

	def destroy
		@label = Label.find(params[:id])
    @label.destroy
		redirect_to board_path(@label.board_id)
  end

  def show
    id = params['id']
    @label = Label.find(id)
    @board = @label.board
  end

  private

    def label_params
      params.require(:label).permit(:user_id, :board_id, :name, :color)
    end
end
