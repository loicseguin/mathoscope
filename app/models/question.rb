# == Schema Information
#
# Table name: questions
#
#  id         :integer         not null, primary key
#  created_at :datetime        not null
#  updated_at :datetime        not null
#  content    :text
#

class Question < ActiveRecord::Base
  attr_accessible :content, :choices_attributes

  has_many :choices, dependent: :destroy
  has_many :responses

  validates :content, presence: true

  accepts_nested_attributes_for :choices,
    reject_if: lambda { |a| a[:content].blank? },
    allow_destroy: true

  def self.random
    if (c = count) != 0
      find(:first, :offset =>rand(c))
    end
  end
end
