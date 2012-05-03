# == Schema Information
#
# Table name: responses
#
#  id          :integer         not null, primary key
#  content     :string(255)
#  user_id     :integer
#  question_id :integer
#  created_at  :datetime        not null
#  updated_at  :datetime        not null
#  good_answer :boolean
#

class Response < ActiveRecord::Base
  attr_accessible :content, :question_id, :good_answer
  belongs_to :user

  validates :user_id, presence: true
end
