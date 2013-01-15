require 'spec_helper'

describe Publication do

  let(:user) { FactoryGirl.create(:user) }
  before { @publication = user.publications.build(title: "A Star fall", genre: 0, name: "Sciences et Avenir", pages: 76) }

  subject { @publication }

  it { should respond_to(:title) }
  it { should respond_to(:genre) }
  it { should respond_to(:name) }
  it { should respond_to(:pages) }
  it { should respond_to(:user_id) }
  it { should respond_to(:user) }
  its(:user) { should == user }

  it { should be_valid }

  describe "accessible attributes" do
    it "should not allow access to user_id" do
      expect do
        Publication.new(user_id: user.id)
      end.to raise_error(ActiveModel::MassAssignmentSecurity::Error)
    end    
  end

  describe "when user_id is not present" do
    before { @publication.user_id = nil }
    it { should_not be_valid }
  end

  describe "with blank title" do
    before { @publication.title = " " }
    it { should_not be_valid }
  end

  describe "with content that is too long" do
    before { @publication.title = "a" * 141 }
    it { should_not be_valid }
  end

  describe "with blank name" do
    before { @publication.name = " " }
    it { should_not be_valid }
  end

  describe "with name that is too long" do
    before { @publication.name = "a" * 141 }
    it { should_not be_valid }
  end

  describe "with no genre" do
    before { @publication.genre = " " }
    it { should_not be_valid }
  end

  describe "with genre that is not valid" do
    before { @publication.genre = 2 }
    it { should_not be_valid }
  end

  describe "with no page" do
    before { @publication.pages = " " }
    it { should_not be_valid }
  end

  describe "with zero page" do
    before { @publication.pages = 0 }
    it { should_not be_valid }
  end
end
