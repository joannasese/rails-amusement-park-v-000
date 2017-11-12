class User < ActiveRecord::Base
  has_secure_password

  enum role: [:admin]

  has_many :rides
  has_many :attractions, through: :rides
  validates :name,
  :password,
  :height,
  :tickets,
  :happiness,
  :nausea,
  :presence => true

  def mood
    self.happiness < self.nausea ? 'sad' : 'happy'
  end

end
