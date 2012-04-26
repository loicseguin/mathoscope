# == Schema Information
#
# Table name: choices
#
#  id          :integer         not null, primary key
#  content     :string(255)
#  answer      :boolean
#  question_id :integer
#  created_at  :datetime        not null
#  updated_at  :datetime        not null
#

class Choice < ActiveRecord::Base
  attr_accessible :answer, :content

  belongs_to :question

  validates :content, presence: true
end
