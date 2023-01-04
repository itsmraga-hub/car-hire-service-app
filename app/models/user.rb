class User < ApplicationRecord
  has_many :reservations
  belongs_to :role

  after_initialize :set_default_role!

  private
  def set_default_role!
    self.role ||= Role.find_by_name('user')
  end
end
