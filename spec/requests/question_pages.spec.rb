require 'spec_helper'

describe "Question pages" do

  { subject page }

  describe "index" do
    describe "when not signed in" do
      it { should_not have_selector('title', text: '|') }
    end

    describe "when signed in" do
      describe "as a normal user" do
        let(:user) { FactoryGirl.create(:user) }

        before do
          sign_in user
          visit questions_path
        end

        it { should_not have_selector('title', text: '|') }
      end

      describe "as admin user" do
        let(:admin) { FactoryGirl.create(:admin) }

        before do
          sign_in admin
          visit questions_path
        end

        it { should have_selector('title', text: 'All questions') }

      end
    end
  end
end
