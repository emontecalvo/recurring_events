class DeliveriesController < ApplicationController

	def index
		@deliveries = Delivery.all
	end

	def new
		@delivery = Delivery.new
	end

	def create
		@delivery = Delivery.new(delivery_params)

		if @delivery.save
			redirect_to @delivery
		else
			render 'new'
		end
	end

	def show
		@delivery = Delivery.find(params[:id])
	end

	def edit
		@delivery = Delivery.find(params[:id])
	end

	def update
		@delivery = Delivery.find(params[:id])
		if @delivery.update(params[:delivery].permit(:title, :body))
			redirect_to @delivery
		else
			render 'edit'
		end
	end

	def destroy
		@delivery = Delivery.find(params[:id])
		@delivery.destroy
		
		redirect_to root_path
	end

	private

	def delivery_params
		params.require(:delivery).permit(:title, :start_date, :num_of_months_between_recur, :delivery_date, :buffer_days)
	end

	def find_delivery

	end

end
