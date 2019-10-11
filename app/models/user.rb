class User <ActiveRecord::Base
  has_many :problems
  has_secure_password

  validates :name, :email, presence: { message: "Got to Put Something There"}
  validates :email, uniqueness: true
end
