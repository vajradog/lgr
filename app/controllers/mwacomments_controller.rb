class MwacommentsController < ApplicationController

	def index
		@mwacomments = Mwacomment.all
	end

	def new
		@mwacomment = Mwacomment.new
	end

	def create
		@mwacomment = Mwacomment.new
		if @mwacomment.save(comment_params)
			flash[:success] = "Comment created"
			redirect_to :back
		else
			flash[:error] = "Could not create comment"
			render 'new'
		end
	end

	def show
		@mwacomment = Mwacomment.find(params[:id])
	end

	def edit
		@mwacomment = Mwacomment.find(params[:id])
	end
	def updated
		@mwacomment = Mwacomment.find(params[:id])
		if @mwacomment.update_attributes(comment_params)
			flash[:success] = "Comment updated"
			redirect_to :back
		else
			flash[:error] = "Could not update comment"
			render 'edit'
		end
	end

	def delete
		Mwacomment.find([:id]).destroy
		flash[:success] = "Comment deleted"
		redirect_to root
	end

	private

	def comment_params
		params.require(:mwacomment).permit(:body)
	end
end