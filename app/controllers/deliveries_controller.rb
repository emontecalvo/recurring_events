class DeliveriesController < ApplicationController

	def index
		@deliveries = Delivery.all
	end

	def new
		@delivery = Delivery.new
	end

	def create
		@delivery = Delivery.new(delivery_params)
		# x = is_weekday?
		# p "**************"
		# p x
		# p "* * * * *  start  date * * * * "
		# p @delivery.start_date
		is_holiday?

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
		if @delivery.update(params[:delivery].permit(:title, :start_date, :num_of_months_between_recur, :delivery_date, :buffer_days))
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

	def is_holiday?
		holidays = [
			"2017-01-02 00:00:00 UTC",
			"2017-01-16 00:00:00 UTC",
			"2017-02-20 00:00:00 UTC",
			"2017-05-29 00:00:00 UTC",
			"2017-07-04 00:00:00 UTC",
			"2017-09-04 00:00:00 UTC",
			"2017-10-09 00:00:00 UTC",
			"2017-11-11 00:00:00 UTC",
			"2017-11-23 00:00:00 UTC",
			"2017-12-25 00:00:00 UTC",
			"2018-01-01 00:00:00 UTC",
			"2018-01-15 00:00:00 UTC",
			"2018-02-19 00:00:00 UTC",
			"2018-05-28 00:00:00 UTC",
			"2018-07-04 00:00:00 UTC",
			"2018-09-03 00:00:00 UTC",
			"2018-10-08 00:00:00 UTC",
			"2018-11-12 00:00:00 UTC",
			"2018-11-22 00:00:00 UTC",
			"2018-12-25 00:00:00 UTC",
		]
		if holidays.include?(@delivery.start_date.to_s)
			p " $ $ $ $ $ $ $ $"
			p "its a HOLIDAY"
		else
			p " @ @ @ @ @ @ @ @ @"
			p "ITS NOT A HOLIDAY"
		end

	end

	def is_weekday?
		if @delivery.start_date.wday > 0 && @delivery.start_date < 6
			p "ITS A WEEKDAY!!"
			p @delivery.start_date.wday
		end
		return ["its a weekday", @delivery.start_date.wday]
	end

	private

	def delivery_params
		params.require(:delivery).permit(:title, :start_date, :num_of_months_between_recur, :delivery_date, :buffer_days)
	end

	def find_delivery

	end

end
