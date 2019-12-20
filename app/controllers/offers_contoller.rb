class OffersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_offer, only: [:accept, :reject]
  before_action :is_authorized, only: [:accept, :reject]

  def create
    req = Request.find(offer_params[:request_id])

    if req && req.user_id == current_user.id
      redirect_to request.referrer, alert: "You cannot offer your own request"
  end
   
   if Offer.exist?(user_id: current_user.id, request_id: offer_params[:request_id])
    redirect_to request.referrer, alert: 'You cannot make only one offer at the moment'


  def accept

  end


  def reject

  end


  private

  def set_offer
    @offer = Offer.find(params[:id])
  end


  def is_authorized
    redirect_to root_path, alert: "You dont't have permission" unless current_user,id == @offer.request.user_id    
    end

    def offer_params
      params.require(:offer).permit(:amount, :days, :note, :request_id, :status)
    end

end