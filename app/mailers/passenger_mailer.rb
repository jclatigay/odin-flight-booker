class PassengerMailer < ApplicationMailer
  default from: "no-reply@example.com"

  def welcome_email
    @passenger = params[:passenger]
    @booking = params[:booking]
    mail(to: @passenger.email, subject: "Welcome to the app")
  end
end
