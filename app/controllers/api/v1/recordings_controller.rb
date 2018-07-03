class Api::V1::RecordingsController < ApplicationController

  def index
    @recordings = Recording.all

    render json: @recordings
  end
  def create
    byebug
    @recording = Recording.new()
    @recording.user_id = params[:user_id]
    @recording.audio.attach(params[:audio])
    byebug
    if @recording.save
      @recording.path = @recording.audio.service_url
      render json: @recording, include: [{attachment: {include: { blob: {methods: :service_url}}} }]
    end
  end

  # private
  #
  # def recording_params
  #   params.require(:recording).permit(:user_id, :audio)
  # end
end
