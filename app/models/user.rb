class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :reservations
  has_many :cars

  belongs_to :role

  after_initialize :set_default_role!

  private
  def set_default_role!
    self.role ||= Role.find_by_name('user')
  end
end
