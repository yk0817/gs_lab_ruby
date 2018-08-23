require 'rails_helper'

RSpec.describe Headline, type: :model do
  # 全テストデータで用いるデータのセットアップ
  before do
    SchoolBlog.create(url: 'https://gsacademy.tokyo/', name: 'gsacademy')
  end

  it "1 + 1 = 2" do
    expect(1 + 1).to eq 2
  end

  # it: 具体例の記述
  it "Headlineのデータが一つ増えること" do
    headline_ex1 = Headline.create(title: "test", school_blog_id: SchoolBlog.first.id)
    expect(headline_ex1.title).to eq "test"
    expect(Headline.count).to eq 1
  end


  # factory bot を使った記述
  it ".raise error" do
    headline_ex2 = FactoryBot.create(:headline , school_blog_id: SchoolBlog.first.id)
    # headline_ex2 = create :headline , school_blog_id: SchoolBlog.first.id
    expect(headline_ex2.title).to eq "MyText"
    expect(Headline.count).to eq 1
  end

  # 遅延評価 letを使う (example節(itの中では)では　使えない)
  let(:headline_ex2){ create :headline , title: "test" }
  it ".raise error" do
    # error
    # headline_ex2 = create :headline , title: "test"
    # 遅延評価
    expect { headline_ex2 }.to raise_error(ActiveRecord::AssociationTypeMismatch)
  end

  # describe: テスト対象を明らかにする
  describe '.create' do
    let(:headline_ex3){ create :headline , title: "test" }
    it ".raise error" do
      expect { headline_ex3 }.to raise_error(ActiveRecord::AssociationTypeMismatch)
    end
  end

  describe ".create" do
    # ブロックの中で評価される
    # before do
    #   Headline.create(title: "test", school_blog_id: SchoolBlog.first.id)
    # end
    let!(:headline_ex4){ create :headline, title: "test", school_blog_id: SchoolBlog.first.id }
    it "title eq test" do
      expect(Headline.first.title).to eq "test"
    end
    it "Headline model data exists" do
      expect(Headline.count).to eq 1
    end
  end

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
    context "when foreign_key assigned" do
      subject { Headline.create( title: 'test', school_blog_id: SchoolBlog.first.id ) }
      it { should be_valid }
    end
  end

  # 即時評価 let!を使ったバージョン
  describe '.create' do
    let(:school_blog){ create :school_blog, url:  'https://gsacademy.tokyo/', name: 'gsacademy' }
    context "when foreign_key assigned using let" do
      let(:headline){ create :headline, title: 'test2', school_blog_id: school_blog.id }
      it "headline exists and eq test2" do
        expect(headline.title).to eq 'test2'
      end
    end
  end

  # バリデーションのテストをしてみる
  # titleカラムを6文字以上記述したらエラーが出るか
  # describe: テスト対象 ここではcreate
  # context: 状況を示す ここでは title6文字以上とする
  # it: 具体例(期待する戻り値)を記述
  describe '.create' do
    let(:school_blog){ create :school_blog, url:  'https://gsacademy.tokyo/', name: 'gsacademy' }
    let(:validation_test){ create :headline, title: 'validation_test_title', school_blog_id: school_blog.id }
    context "when create title more than 7 letters" do
      it "does not save headline data" do
        expect{ validation_test }.to raise_error(ActiveRecord::RecordInvalid)
      end
    end
  end

end
