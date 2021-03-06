class Task < ActiveRecord::Base
  belongs_to :customer
  validates :description, presence: true

  before_save :default_values

  private

  def default_values
    self.completed ||= false
    nil
  end
end
