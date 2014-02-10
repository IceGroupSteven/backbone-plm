class User < ActiveRecord::Base
  validates_presence_of :first_name, :last_name
  validates :email, presence: true, uniqueness: true
  has_secure_password

  belongs_to :company

  def full_name
    "#{first_name}" + " #{last_name}"
  end
end
