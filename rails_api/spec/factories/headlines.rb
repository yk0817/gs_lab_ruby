FactoryBot.define do
  factory :headline do
    title { "MyText" }
    label { "MyString" }
    school_blog { "" }
    
    trait :with_school_blog do
      association :school_blog, factory: :school_blog
    end
  end
end
