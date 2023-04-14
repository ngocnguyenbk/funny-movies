require "rails_helper"

RSpec.describe "Home", js: true, type: :feature do
  let(:user) { create(:user, username: "tester", email: "tester@gmail.com") }

  before do
    log_in_with(user.username, "password")
  end

  scenario "with one movie" do
    movie = create(:movie, user: user)

    visit root_path

    expect(page).to have_content(movie.title)
  end

  scenario "with two movies" do
    movie1 = create(:movie, user: user)
    movie2 = create(:movie, user: user, url: "https://www.youtube.com/watch?v=9bZkp7q19f0")

    visit root_path

    expect(page).to have_content(movie1.title)
    expect(page).to have_content(movie2.title)
  end

  scenario "with no movies" do
    visit root_path

    expect(page).to have_content("No movies found. Please add some movies.")
  end

  scenario "upvote a movie" do
    movie = create(:movie, user: user)

    visit root_path

    expect do
      find("li.upvote[data-id='#{movie.id}']").click
    end.to change { movie.reload.likes_count }.from(0).to(1)
  end

  scenario "upvote a movie twice" do
    movie = create(:movie, user: user)
    create(:vote, user: user, movie: movie, vote_type: :upvote)
    movie.update(likes_count: 1)

    visit root_path

    expect do
      find("li.upvote[data-id='#{movie.id}']").click
    end.to change { movie.reload.likes_count }.from(1).to(0)
  end

  scenario "downvote a movie" do
    movie = create(:movie, user: user)

    visit root_path

    expect do
      find("li.downvote[data-id='#{movie.id}']").click
    end.to change { movie.reload.dislikes_count }.from(0).to(1)
  end

  scenario "downvote a movie twice" do
    movie = create(:movie, user: user)
    create(:vote, user: user, movie: movie, vote_type: :downvote)
    movie.update(dislikes_count: 1)

    visit root_path

    expect do
      find("li.downvote[data-id='#{movie.id}']").click
    end.to change { movie.reload.dislikes_count }.from(1).to(0)
  end
end
