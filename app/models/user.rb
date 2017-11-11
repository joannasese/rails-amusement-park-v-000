class User < ActiveRecord::Base
  has_secure_password

  # enum role: [:user, :admin]
  has_many :rides
  has_many :attractions, through: :rides

  def mood
    self.happiness < 7 ? 'sad' : 'happy'
  end

end
