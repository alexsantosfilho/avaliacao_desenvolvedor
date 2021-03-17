require 'rails_helper'

feature 'User uploads file' do
  scenario 'successfully' do
    visit root_path

    attach_file('upload', "#{Rails.root}/spec/fixtures/dados.txt", make_visible: true)

    click_on 'Upload'
    expect(page).to have_content 'João Silva'
    expect(page).to have_content 'Amy Pond'
    expect(page).to have_content 'Marty McFly'
    expect(page).to have_content 'Snake Plissken'
    expect(page).to have_content 'R$ 50.00'
    expect(page).to have_content 'R$ 5.00'
    expect(page).to have_content 'R$ 20.00'
  end
  scenario 'without file' do
    visit root_path
    click_on 'Upload'
    expect(page).to have_content 'Arquivo .txt obrigatório'
  end
  scenario 'with blank file' do
    visit root_path
    attach_file("File", "#{Rails.root}/spec/fixtures/blank.txt")
    click_on 'Upload'
    expect(page).to have_content 'Tipo inválido. Apenas arquivos .txt'
  end
  scenario 'with invalid file' do
    visit root_path
    attach_file("File", Rails.root + "spec/fixtures/img.png")
    click_on 'Upload'
    expect(page).to have_content 'Tipo inválido. Apenas arquivos .txt'
  end
end