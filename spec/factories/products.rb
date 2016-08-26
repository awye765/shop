FactoryGirl.define do
  factory :product do
    name "Almond Toe Court Shoes"
    colour "Patent Black"
    category "Women's Footwear"
    price "99.00"
    stock 5
    image Rack::Test::UploadedFile.new(Rails.root + 'spec/files/images/almond_toe_court_shoes.png', 'image/png')
  end
end
