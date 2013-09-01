FactoryGirl.define do
  factory :user do
    first_name 'Rui'
    last_name 'Cheng'
    email 'ktei2008@gmail.com'
    password 'blizzard'
  end

  sequence :email do |n|
    "user-#{n}@test.com"
  end

  factory :album do |album|
    album.caption 'foobar'
    album.description 'foobar desc'
    album.association :user
  end

  sequence :caption do |n|
    "album-caption#{n}"
  end
  #
  #factory :photo do |photo|
  #  photo.description "foobar desc"
  #  photo.association :album
  #end
end