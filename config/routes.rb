Rails.application.routes.draw do
  get "auth/github/callback" => "sessions#create", success: true, as: nil
  get "auth/failure" => "sessions#create", success: false, as: nil
  get "auth/github" => proc { [404, {}, []] }, as: :sign_in
  delete "sign-out" => "sessions#destroy", as: :sign_out

  get "claim" => "claims#create"

  root to: "claims#new"
end
