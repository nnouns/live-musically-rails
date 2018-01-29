class OpportunitiesController < ApplicationController
	def new
		@employer_opportunity_form = EmployerOpportunityForm.new
	end

	def create
		@employer_opportunity_form = EmployerOpportunityForm.new(employer_opportunity_form_params)
		respond_to do |format|
			if @employer_opportunity_form.save
				format.html { redirect_to my_profile_path, notice: 'Opportunity created' }
			else
				format.html {
					render action: "new"
				}
				format.json { render json: @employer_opportunity_form.errors, status: :unprocessable_entity
				}
			end
		end
	end

	def employer_opportunity_form_params
		if params[:category]
			params[:employer_opportunity_form][:category] = params[:category]
		end

		if params[:artist_types]
			params[:employer_opportunity_form][:artist_types] = params[:artist_types]
		end

		if params[:timeframe_of_post]
			params[:employer_opportunity_form][:timeframe_of_post] = params[:timeframe_of_post]
		end

		params.require(:employer_opportunity_form).permit(:address, :category, :city, :description, :event_start_date, :event_end_date, :event_end_time, :event_start_time, :name, :state, :timeframe_of_post, :title, :zip, :artist_types => []).merge(employer: current_user)
	end
end
