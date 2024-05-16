class LabelsController < ApplicationController
  def new
    @label = Label.new(board_id: params[:board_id])
  end

  def create
    @label = Label.new(label_params)
    if @label.save!
      redirect_to boards_path
    else
      render :new
    end
  end

  private

    def label_params
      params.require(:label).permit(:user_id, :board_id, :name, :color)
    end
end
