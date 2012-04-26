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

require 'spec_helper'

describe Choice do
  before do
    @question = Question.new(content: "A super duper question. Yes?")
    @choice = @question.choices.build(content: "Yes", answer: false)
  end

  subject { @choice }

  it { should respond_to(:content) }
  it { should respond_to(:answer) }
  it { should respond_to(:question_id) }
  it { should be_valid }
end
