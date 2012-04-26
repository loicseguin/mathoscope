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

require 'spec_helper'

describe Response do
  let(:user) { FactoryGirl.create(:user) }
  before do
    @response = user.responses.build(question_id: 3, choice_id: 2, chosen: true)
  end

  subject { @response }

  it { should respond_to(:content) }
  it { should respond_to(:chosen) }
  it { should respond_to(:user_id) }
  it { should respond_to(:choice_id) }
  it { should respond_to(:question_id) }
  it { should be_valid }

  describe "accessible attributes" do
    it "should not allow access to user_id" do
      expect do
        Response.new(user_id: user.id)
      end.should raise_error(ActiveModel::MassAssignmentSecurity::Error)
    end
  end
end
