require "rails_helper"

RSpec.describe Blog, type: :model do
  it "is valid with author, title and content" do
    expect(FactoryGirl.build(:blog)).to be_valid
  end

  it "is valid with out tags" do
    expect(FactoryGirl.build(:blog, tag_list: nil)).to be_valid
  end

  it 'is invalid without an author' do
    blog = FactoryGirl.build(:blog, author: nil)
    blog.valid?
    expect(blog.errors[:author]).to include("can't be blank")
  end

  it "is invalid without a title" do
    blog = FactoryGirl.build(:blog, title: nil)
    blog.valid?
    expect(blog.errors[:title]).to include("can't be blank")
  end

  it "is invalid without content" do
    blog = FactoryGirl.build(:blog, content: nil)
    blog.valid?
    expect(blog.errors[:content]).to include("can't be blank")
  end

  it "has friendly_id for url" do
    blog = FactoryGirl.create(:blog, title: 'TEST blog FOR friendly ID')
    expect(blog.friendly_id).to eq('test-blog-for-friendly-id')
  end

  it "returns 6 blog contents per page" do
    blog = Blog.per_page
    expect(blog).to eq(6)
  end

  context "tag" do
    it "is taggable" do
      blog = FactoryGirl.create(:blog)
      blog.tag_list.add("tag")
      expect(blog.tag_list).to eq(["tag"])
    end

    it "can have many tags" do
      blog = FactoryGirl.create(:blog)
      blog.tag_list.add(["tag1", "tag2", "tag3"])
      expect(blog.tag_list).to eq(["tag1", "tag2", "tag3"])
    end

    it "is parsed for dashes in place of spaces" do
      blog = FactoryGirl.create(:blog)
      blog.tag_list.add("tag1 with spaces", "tag2 with spaces")
      blog.save
      expect(Blog.ordered_tags).to eq(["tag1-with-spaces", "tag2-with-spaces"])
    end
  end

  describe "sort_filter" do
    before :each do
      @blog1 = FactoryGirl.create(:blog, title: "blog 1", created_at: 3.days.ago)
      @blog2 = FactoryGirl.create(:blog, title: "blog 2", created_at: 2.days.ago)
      @blog3 = FactoryGirl.create(:blog, title: "blog 3", created_at: 1.day.ago)
    end

    it 'returns oldest post first when sort param is oldest' do
      expect(Blog.sort_filter("oldest").first.title).to eq("blog 1")
    end

    it 'returns newest post first when sort param is newest' do
      expect(Blog.sort_filter("newest").first.title).to eq("blog 3")
    end

    it 'returns default ordered posts when sort param has no match' do
      expect(Blog.sort_filter("giberish").first.title).to eq("blog 1")
    end
  end
end
