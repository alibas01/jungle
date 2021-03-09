require 'rails_helper'

RSpec.feature "Client navigate to product detail page by clicking ", type: :feature, js: true do
  # SETUP
  before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
  end 

  scenario "They see one product" do
    # ACT
    visit root_path

    # DEBUG / VERIFY
    save_screenshot('test1.png')
    first(:link, "Details").click
    sleep(1)
    save_screenshot('test2.png')
    expect(page).to have_css 'section.products-show', count: 1
  end
  
end
