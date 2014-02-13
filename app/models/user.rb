class User < ActiveRecord::Base
  validates_presence_of :first_name, :last_name
  validates :email, presence: true, uniqueness: { case_sensitive: false }
  has_secure_password

  belongs_to :company
  has_many :divisions, through: :company

  def full_name
    "#{first_name} #{last_name}"
  end
end
