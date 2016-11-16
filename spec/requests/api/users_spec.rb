require "rails_helper"

# describe is a suite
describe "User API Tests" do
  it "GET /users should return 200" do
  # it is a spec
    get "/users"

    expect(response).to have_http_status(200)
    # assertion
  end

  it "Post /users should return 201" do
    post "/users", params: {
      user: {
        username: "foobar",
        password: "password"
      }
    }
    expect(response).to have_http_status(201)
  end

  it "Post /users should return 400" do
    post "/users", params: {
      user: {
        username: "foobar"
      }
    }
    expect(response).to have_http_status(400)
  end

  it "GET /users/:id should return 200" do
    user = User.create(username: "pizzaguy", password: "password")
    get "/users/#{user.id}/edit"
    expect(response).to have_http_status(200)
  end

  it "PUT /users/:id should return 204" do
    user = User.create(username: "pizzaguy", password: "password")
    put "/users/#{user.id}", params: {
      user: {
        username: "sandwich"
      }
    }
    expect(response).to have_http_status(204)
  end

  it "DELETE /users/:id should return 200" do
    user = User.create(username: "pizzaguy", password: "password")
    delete "/users/#{user.id}"
    expect(response).to have_http_status(200)
  end


end
