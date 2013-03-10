class UserCreatedJob < Struct.new(:user_id)
  PRIORITY = 2

  def self.enqueue(user)
    Delayed::Job.enqueue(new(user.id), priority: PRIORITY)
  end

  def perform
    deliver_welcome
    convert_guest_to_user
  end

  def error(job, exception)
    Airbrake.notify(exception)
  end

  private

  def deliver_welcome
    Mailer.welcome(user).deliver
  end

  def convert_guest_to_user
    guest = Guest.where(email: user.email).first
    guest.try(:to_user)
  end

  def user
    User.find(user_id)
  end
end
