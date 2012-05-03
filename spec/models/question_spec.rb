# == Schema Information
#
# Table name: questions
#
#  id         :integer         not null, primary key
#  created_at :datetime        not null
#  updated_at :datetime        not null
#  content    :text
#  nb_answers :integer
#

require 'spec_helper'

describe Question do
  before do
    @question = Question.new(content: "Is this a question you want to answer?")
  end

  subject { @question }

  it { should respond_to(:content) }
  it { should respond_to(:choices) }
  it { should be_valid }
end
