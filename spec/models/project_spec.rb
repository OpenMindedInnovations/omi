require 'rails_helper'

RSpec.describe Project, type: :model do
  it 'is valid with category, status, name, and description' do
    expect(FactoryGirl.build(:project)).to be_valid
  end

  it 'is valid without image stored in the db' do
    expect(FactoryGirl.build(:project, image: nil)).to be_valid
  end

  it 'is invalid without a name' do
    project = FactoryGirl.build(:project, name: nil)    
    project.valid?
    expect(project.errors.messages[:name]).to eq(["can't be blank"])
  end

  it 'is invalide without enumerize category' do
    project = FactoryGirl.build(:project, category: "non-exist category")
    project.valid?
    expect(project.errors.messages[:category]).to eq(["is not included in the list"])
  end

  it 'can be queried with enumerized scope' do
    project = FactoryGirl.create(:project, category: "contract")
    expect(Project.with_category(:contract).last.name).to eq(project.name)
  end

  it 'has an option to be featured in the front page' do
    expect(FactoryGirl.build(:project, featured: nil)).to be_valid
  end

  it 'can have uploaded images' #to be tested for image upload

  it { should belong_to(:owner) }

  it 'can be marked by user as favorite' do
    project = FactoryGirl.create(:project)
    user = FactoryGirl.create(:user)
    user.mark_as_favorite project
    expect(user.favorite_projects).to include(project)
  end

  context "tag" do
    it "is taggable" do
      project = FactoryGirl.create(:project)
      project.tag_list.add("tag")
      expect(project.tag_list).to eq(["tag"])
    end

    it "can have many tags" do
      project = FactoryGirl.create(:project)
      project.tag_list.add("tag1", "tag2", "tag3")
      expect(project.tag_list).to eq(["tag1", "tag2", "tag3"])
    end

    it "is parsed for dashes in place of spaces" do
      project = FactoryGirl.create(:project)
      project.tag_list.add("tag1 with spaces", "tag2 with spaces")
      project.save
      expect(Project.ordered_tags).to eq(["tag1-with-spaces", "tag2-with-spaces"])
    end
  end

  it 'returns a list of available status in the database' do
    project1 = FactoryGirl.create(:project, status: "active")
    project2 = FactoryGirl.create(:project, status: "completed")
    project3 = FactoryGirl.create(:project, status: "inactive")
    expect(Project.status_list).to match_array(['active', 'completed', 'inactive'])
  end

  describe "sort_filter" do
    before :each do
      @project1 = FactoryGirl.create(:project, name: "project 1", created_at: 3.days.ago)
      @project2 = FactoryGirl.create(:project, name: "project 2", created_at: 2.days.ago)
      @project3 = FactoryGirl.create(:project, name: "project 3", created_at: 1.day.ago)

    end

    context 'returns favorited projects' do
      before :each do
        @user1 = FactoryGirl.create(:user)
        @user2 = FactoryGirl.create(:user)
        @user3 = FactoryGirl.create(:user)
        @user1.mark_as_favorite [ @project1 ]
        @user2.mark_as_favorite [ @project1, @project2 ]
        @user3.mark_as_favorite [ @project1, @project2, @project3]
      end

      it 'most favorited first when sort param is most-favorited' do
        expect(Project.sort_filter("most-favorited").first.name).to eq("project 1")
      end

      it 'returns least favorited projects when sort param is least-favorited' do
        expect(Project.sort_filter("least-favorited").first.name).to eq("project 3")
      end
    end

    it 'returns oldest projects first when sort param is oldest' do
      expect(Project.sort_filter("oldest").first.name).to eq("project 1")
    end

    it 'returns newest projects first when sort param is newest' do
      expect(Project.sort_filter("newest").first.name).to eq("project 3")
    end

    it 'returns default ordered projects when sort param has no match' do
      expect(Project.sort_filter("giberish").first.name).to eq("project 1")
    end
  end

end
