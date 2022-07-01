class SignupsController < ApplicationController
rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity
  def create
    signup = Signup.create!(signup_params)
    # if signup.valid?
      render json: signup, include: :activities, status: :created
    # else
    #   render json: {errors: ["validation errors"]}, status: :unprocessable_entity
    # end

  end


  private
  
  def render_unprocessable_entity(invalid)
    render json: {errors: invalid.record.errors.full_messages}, status: :unprocessable_entity
  end


  def signup_params
    params.permit(:activity_id, :camper_id, :time)
  end

end
