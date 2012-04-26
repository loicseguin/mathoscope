# == Schema Information
#
# Table name: responses
#
#  id          :integer         not null, primary key
#  content     :string(255)
#  user_id     :integer
#  question_id :integer
#  choice_id   :integer
#  chosen      :boolean
#  created_at  :datetime        not null
#  updated_at  :datetime        not null
#

class Response < ActiveRecord::Base
  attr_accessible :choice_id, :chosen, :content, :question_id
  belongs_to :user

  validates :choice_id, presence: true
  validates :question_id, presence: true
  validates :user_id, presence: true
end
