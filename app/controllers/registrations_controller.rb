# frozen_string_literal: true

class RegistrationsController < ApplicationController
  skip_before_action :authenticate

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.invited?(params[:invitation_code]) && @user.save
      session = @user.sessions.create!
      cookies.signed.permanent[:session_token] = { value: session.id, httponly: true }

      send_email_verification
      redirect_to root_path, notice: 'Welcome! You have signed up successfully'
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def permitted_params
    params.permit(
      :authenticity_token,
      :invitation_code,
      :commit,
      :email,
      :password,
      :password_confirmation
    )
  end

  def user_params
    permitted_params.slice(
      :email,
      :password,
      :password_confirmation
    )
  end

  def send_email_verification
    UserMailer.with(user: @user).email_verification.deliver_later
  end
end
