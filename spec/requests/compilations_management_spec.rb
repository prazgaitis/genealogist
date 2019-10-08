require 'rails_helper'

RSpec.describe 'Compilations', :type => :request do
    it "creates a new compilation" do
        post "/compilations",
            params: {
                compilation: {
                    page_count: 1,
                    url_identifier: "abc123"
                }
            }

        expect(response).to redirect_to(assigns(:compilation))
        follow_redirect!

        expect(response.body).to include("Compilation was successfully created")
    end
end