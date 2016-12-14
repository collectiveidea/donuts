describe "Today's Claims" do
  let(:json) { JSON.parse(response.body) }

  it "responds successfully" do
    get "/api/v1/claims/today"
    expect(response.code).to eq "200"
  end

  it "responds with json" do
    get "/api/v1/claims/today"
    expect(response["Content-Type"]).to eq "application/json; charset=utf-8"
  end

  it "lists users bringing donuts today" do
    user1 = create(:user, name: "Laura Mosher", github_login: "laura")
    user2 = create(:user, name: "Chris Gaffney", github_login: "chris")
    create(:claim, user: user1, date: Date.current)
    create(:claim, user: user2, date: Date.current)

    get "/api/v1/claims/today"
    expect(json).to eq [
      {
        "id" => user1.id,
        "name" => "Laura Mosher",
        "display_name" => "Laura",
        "github_login" => "laura",
      },
      {
        "id" => user2.id,
        "name" => "Chris Gaffney",
        "display_name" => "Chris",
        "github_login" => "chris",
      },
    ]
  end

  it "doesn't list users who didn't bring donuts" do
    create(:user)

    get "/api/v1/claims/today"
    expect(json).to eq []
  end

  it "doesn't list users who brought donuts yesterday" do
    create(:claim, date: Date.yesterday)

    get "/api/v1/claims/today"
    expect(json).to eq []
  end

  it "only lists the user once if they brought donuts more than once" do
    user = create(:user, name: "Laura", github_login: "laura")
    create_list(:claim, 3, user: user, date: Date.current)

    get "/api/v1/claims/today"
    expect(json).to eq [
      {
        "id" => user.id,
        "name" => "Laura",
        "display_name" => "Laura",
        "github_login" => "laura",
      },
    ]
  end
end
