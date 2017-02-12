class LandTrustsController < ApplicationController
  def index
    land_trusts = LandTrust.all
    render json: land_trusts, status: 200  
  end

  def show
    land_trust = LandTrust.find(params[:id])
    render json: land_trust, status: 200
  end

  def destroy
    land_trust = LandTrust.find(params[:id])
    land_trust.destroy
    render json: land_trust, status: 200
  end

  def create
    land_trust = LandTrust.new(params[:name])
    land_trust.save
    render json: land_trust, status 200
  end

  def update
    land_trust = LandTrust.find(params[:id])

end