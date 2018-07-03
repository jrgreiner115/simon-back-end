class Api::V1::RecordingsController < ApplicationController
  before_action :requires_login, only: [:index, :show, :create, :delete]

  def index
    @recordings = Recording.all

    render json: @recordings
  end
  def create
    @recording = Recording.new(user_id: 1, path: params[:id])
    if @recording.save

      render json: @recording
    end
  end
end
