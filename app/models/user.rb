class User <ActiveRecord::Base
  has_many :problems
  has_secure_password

  validates :name, :email, presence: true
end
