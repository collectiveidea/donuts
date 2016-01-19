feature "Claiming a Donut Day" do
  def donuts_button
    find(".claim-button")
  end

  scenario "A visitor can claim today as a donut day" do
    sign_in_on_github

    visit root_path
    donuts_button.click

    expect(current_path).to eq(root_path)
    expect(donuts_button).to be_disabled

    expect(Claim.count).to eq(1)

    claim = Claim.last
    expect(claim.user).to be_present
    expect(claim.date).to be_today
  end

  scenario "A user can claim today as a donut day" do
    user = create(:user)
    sign_in_on_github(user)

    visit root_path
    donuts_button.click

    expect(current_path).to eq(root_path)
    expect(donuts_button).to be_disabled

    expect(Claim.count).to eq(1)

    claim = Claim.last
    expect(claim.user).to be_present
    expect(claim.date).to be_today
  end

  scenario "A visitor can double down on donuts" do
    create(:claim, date: Date.current)
    sign_in_on_github

    visit root_path
    donuts_button.click

    expect(current_path).to eq(root_path)
    expect(donuts_button).to be_disabled

    expect(Claim.count).to eq(2)

    claim = Claim.order(:created_at).last
    expect(claim.user).to be_present
    expect(claim.date).to be_today
  end

  scenario "A user can double down on donuts" do
    create(:claim, date: Date.current)
    user = create(:user)
    sign_in_on_github(user)

    visit root_path
    donuts_button.click

    expect(current_path).to eq(root_path)
    expect(donuts_button).to be_disabled

    expect(Claim.count).to eq(2)

    claim = Claim.order(:created_at).last
    expect(claim.user).to be_present
    expect(claim.date).to be_today
  end
end
