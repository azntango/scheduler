class CommentsController < ApplicationController
	def destroy
		@comment = Comment.find(params[:id])
		@offer = Offer.find(@comment.offer_id)
		@comments = @offer.getCommentsInReverseOrder
		respond_to do |format|
		    if @comment.destroy
		      format.js
		    else
		      # format.html { render action: "new" }
		      # format.json { render json: @user.errors, status: :unprocessable_entity }
		    end
		end
	end

	def index
		# @comments = Comment.where(tutee_id: current_user.id)
	end

end
