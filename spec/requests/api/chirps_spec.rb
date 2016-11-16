require "rails_helper"

describe "Chirp API Tests" do

  it "GET /chirps should return 200" do
    get "/chirps"
    expect(response).to have_http_status(200)
  end

  it "Post /chirps should return 201" do
    post "/chirps", params: {
      chirp: {
        chirp: "Beard pour-over tattooed photo booth, unicorn whatever hashtag salvia mustache bespoke vaporware. XOXO next level kogi messenger bag, master cleanse mumblecore lyft helvetica actually beard prism post-ironic small batch live-edge. Semiotics chartreuse bespoke typewriter"
      }
    }
    expect(response).to have_http_status(201)
  end

  it "Post /chirps should return 400" do
    post "/chirps", params: {
      chirp: {
        chirp: ""
      }
    }
    expect(response).to have_http_status(400)
  end

  it "GET /chirps/:id should return 200" do
    chirp = Chirp.create(chirp: "pizza")
    get "/chirps/#{chirp.id}/edit"
    expect(response).to have_http_status(200)
  end

  it "PUT /chirps/:id should return 204" do
    chirp = Chirp.create(chirp: "pizza")
    put "/chirps/#{chirp.id}", params: {
      chirp: {
        chirp: "sandwich"
      }
    }
    expect(response).to have_http_status(204)
  end

  it "DELETE /chirps/:id should return 200" do
    chirp = Chirp.create(chirp: "pizza")
    delete "/chirps/#{chirp.id}"
    expect(response).to have_http_status(200)
  end

end
