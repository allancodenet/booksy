# spec/factories/books.rb
FactoryBot.define do
  factory :book, aliases: [:ruby_microscope] do
    title { 'Ruby Under a Microscope' }
    subtitle { 'An Illustrated Guide to Ruby Internals' }
    isbn_10 { 'a593275617' }
    isbn_13 { 'b781593275617' }
    description { 'Ruby Under a Microscope is a cool book!' }
    released_on { '2013-09-01' }
    association :author
    association :publisher
  end

  factory :ruby_on_rails_tutorial, class: Book do
    title { 'Ruby on Rails Tutorial' }
    subtitle { 'Learn Web Development with Rails' }
    isbn_10 { 'a134077709' }
    isbn_13 { 'b780134077703' }
    description { 'The Rails Tutorial is great!' }
    released_on { '2013-05-09' }
    association :author, factory: :michael_hartl
    association :publisher
  end

  factory :agile_web_development, class: Book do
    title { 'Agile Web Development with Rails 4' }
    subtitle { '' }
    isbn_10 { 'a937785564' }
    isbn_13 { 'b781937785567' }
    description { 'Stay agile!' }
    released_on { '2015-10-11' }
    association :author, factory: :sam_ruby
    association :publisher
  end
end