require 'rails_helper'

RSpec.describe Headline, type: :model do
  # it: 具体例の記述
  it ".success" do
    SchoolBlog.create(url: 'https://gsacademy.tokyo/' )
    headline_ex1 = Headline.create(title: "test", school_blog_id: SchoolBlog.first.id)
    expect(headline_ex1.title).to eq "test"
    expect(Headline.count).to eq 1
  end

  # factory bot を使った記述
  let(:headline_ex2){ create :headline , title: "test" }
  it ".raise error" do
    expect { headline_ex2 }.to raise_error(ActiveRecord::AssociationTypeMismatch)
  end

  # describe: テスト対象を明らかにする
  describe '.create' do
    let(:headline_ex3){ create :headline , title: "test" }
    it ".raise error" do
      expect { headline_ex3 }.to raise_error(ActiveRecord::AssociationTypeMismatch)
    end
  end

  before { SchoolBlog.create(url: 'https://gsacademy.tokyo/', name: 'gsacademy') }
  # context: 状況を記述
  describe '.create' do
    context 'When foreign_key no assigned' do
      let(:headline_ex3){ create :headline , title: "test" }
      it ".raise error" do
        expect { headline_ex3 }.to raise_error(ActiveRecord::AssociationTypeMismatch)
      end
    end
  end

  # relationが組まれていないのでbeforeで作成をする
  describe '.create' do
    context 'School blog created' do
      context "when foreign_key assigned" do
        subject { Headline.create( title: 'test', school_blog_id: SchoolBlog.first.id ) }
        it { should be_valid }
      end
    end
  end

  # 即時評価 let!を使ったバージョン
  let!(:school_blog){ create :school_blog, url:  'https://gsacademy.tokyo/', name: 'gsacademy' }
  describe '.create' do
    context "when foreign_key assigned using let" do
      let(:headline){ create :headline, title: 'test2', school_blog_id: school_blog.id }
      it "headline exists and eq test2" do
        expect(headline.title).to eq 'test2'
      end
    end
  end
end
