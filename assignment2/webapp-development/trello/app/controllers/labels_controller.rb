class LabelsController < ApplicationController
  def new
    @label = Label.new(board_id: params[:board_id])
  end

  def create
    @label = Label.new(label_params)
    if @label.save!
      flash[:notice] = "Label created successfully"
      redirect_to board_path(@label.board_id)
    else
      flash[:error] = "Label creation failed"
      render :new
    end
  end

	def edit
		@label = Label.find(params[:id])
	end

	def update
		@label = Label.find(params[:id])
		if @label.update label_params
      flash[:notice] = "Label update successfully"
			redirect_to board_path(@label.board_id)
		else
      flash[:error] = "Label update failed"
			render :edit
		end
	end

	def destroy
		@label = Label.find(params[:id])
		Task.where(label_id: @label.id).update_all(label_id: nil)
    @label.destroy
    flash[:notice] = "Label deleted successfully"
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
