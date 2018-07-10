class Api::V1::RecordingsController < ApplicationController

  def index
    @recordings = Recording.all

    render json: @recordings
  end

  def show
    @recording = Recording.find(params[:id])
    render json: @recording
  end
  def create
    @recording = Recording.new(recording_params)
    if @recording.save
      render json: @recording
    else render json: {
    errors: @user.errors.full_messages
  }, status: :unprocessable_entity
    end
  end

  def update
    @recording= Recording.find(params[:id])
      @recording.update(:name => params[:name])
        render json: @recording
  end

  def destroy
    Recording.destroy(params[:id])
  end

  private

  def recording_params
    params.require(:recording).permit(:user_id, :path, :name)
  end
end
