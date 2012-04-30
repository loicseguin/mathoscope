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
  attr_accessible :content, :choices_attributes, :nb_answers

  has_many :choices, dependent: :destroy
  has_many :responses

  before_validation :count_answers

  validates :content, presence: true
  validate :at_least_one_choice, :at_least_one_answer

  accepts_nested_attributes_for :choices,
    reject_if: proc { |a| a[:content].blank? },
    allow_destroy: true

  def self.random
    if (c = count) != 0
      find(:first, :offset =>rand(c))
    end
  end

  private

    def at_least_one_choice
      if choices.length < 1
        errors[:base] << "A question must have at least one choice."
      end
    end

    def at_least_one_answer
      if nb_answers < 1
        errors[:base] << "A question must have at least one answer."
      end
    end

    def count_answers
      if choices.count == 1
        self.nb_answers = 1
      else
        self.nb_answers = 0
        choices.each do |choice|
          if choice.answer?
            self.nb_answers += 1
          end
        end
      end
    end
end
