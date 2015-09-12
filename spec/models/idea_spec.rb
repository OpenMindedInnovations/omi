require 'rails_helper'

RSpec.describe Idea, type: :model do
  it 'is valid with a name and a description' do
    expect(FactoryGirl.build(:idea)).to be_valid
  end

  it 'is valid without tags' do
    expect(FactoryGirl.build(:idea, tag_list: nil)).to be_valid
  end

  it 'is invalid without a name' do
    idea = FactoryGirl.build(:idea, name: nil)
    idea.valid?
    expect(idea.errors.messages[:name]).to eq(["can't be blank"])
  end

  it 'is invalid without a description' do
    idea = FactoryGirl.build(:idea, description: nil)
    idea.valid?
    expect(idea.errors.messages[:description]).to eq(["can't be blank"])
  end

  it { should belong_to(:user) }

  it 'is votable' do
    idea = FactoryGirl.create(:idea)
    user = FactoryGirl.create(:user)
    idea.vote_by :voter => user
    expect(idea.votes_for.size).to eq(1)
  end

  context "tag" do
    it "is taggable" do
      idea = FactoryGirl.create(:idea)
      idea.tag_list.add("tag")
      expect(idea.tag_list).to eq(["tag"])
    end

    it "can have many tags" do
      idea = FactoryGirl.create(:idea)
      idea.tag_list.add("tag1, tag2, tag3")
      expect(idea.tag_list).to eq(["tag1, tag2, tag3"])
    end

    it "is parsed for dashes in place of spaces" do
      idea = FactoryGirl.create(:idea)
      idea.tag_list.add("tag1 with spaces", "tag2 with spaces")
      idea.save
      expect(Idea.ordered_tags).to eq(["tag1-with-spaces", "tag2-with-spaces"])
    end
  end

  describe "sort_filter" do
    before :each do
      @idea1 = FactoryGirl.create(:idea, name: "idea 1", created_at: 3.days.ago)
      @idea2 = FactoryGirl.create(:idea, name: "idea 2", created_at: 2.days.ago)
      @idea3 = FactoryGirl.create(:idea, name: "idea 3", created_at: 1.day.ago)
      @user1 = FactoryGirl.create(:user)
      @user2 = FactoryGirl.create(:user)
      @idea1.vote_by :voter => @user1
    end

    it 'returns most voted ideas when sort param is votes-up' do
      expect(Idea.sort_filter("votes-up").first.votes_for.size).to eq(1)
    end

    it 'returns least voted ideas when sort param is votes-down' do
      expect(Idea.sort_filter("votes-down").first.votes_for.size).to eq(0)
    end

    it 'returns oldest ideas first when sort param is oldest' do
      expect(Idea.sort_filter("oldest").first.name).to eq("idea 1")
    end

    it 'returns oldest ideas first when sort param is newest' do
      expect(Idea.sort_filter("newest").first.name).to eq("idea 3")
    end

    it 'returns default ordered ideas when sort param has no match' do
      expect(Idea.sort_filter("giberish").first.name).to eq("idea 1")
    end
  end
end
