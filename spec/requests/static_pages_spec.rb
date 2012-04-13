require 'spec_helper'

describe "StaticPages" do
  subject { page }

  describe "Home page" do
    before { visit root_path }

    it { should have_selector('title', text: "The Mathoscope") }
    it { should have_selector('h1', text: "Mathoscope") }
    it { should_not have_selector('title', text: '| Home') }
  end

  describe "Help page" do
    before { visit help_path }

    it { should have_selector('title', text: "The Mathoscope | Help") }
    it { should have_selector('h1', text: "Help") }
  end

  describe "About page" do
    before { visit about_path }

    it { should have_selector('title', text: "The Mathoscope | About") }
    it { should have_selector('h1', text: "About") }
  end
end
