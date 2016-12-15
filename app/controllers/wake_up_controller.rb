class WakeUpController < ApplicationController
  def index
    render json: 'I am awake!', status: 200
  end
end