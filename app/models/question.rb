# == Schema Information
#
# Table name: questions
#
#  id         :integer         not null, primary key
#  content    :string(255)
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

class Question < ActiveRecord::Base
  attr_accessible :content, :choices_attributes

  has_many :choices, dependent: :destroy
  has_many :responses

  validates :content, presence: true

  accepts_nested_attributes_for :choices,
    reject_if: lambda { |a| a[:content].blank? },
    allow_destroy: true

end
