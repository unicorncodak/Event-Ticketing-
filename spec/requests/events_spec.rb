require "rails_helper"

RSpec.describe EventsController, :type => :controller do
    describe "GET index" do
        it "has a 200 status code" do
          get :index
          expect(response.status).to eq(200)
        end
      end
    describe "responds to" do
        it "responds to html by default" do
        post :create, :params => { :event => {   :name => "Any Name", 
                                                    :description => "demo", 
                                                    :location => "string", 
                                                    :category_id => 1, 
                                                    :user_id => 1, 
                                                    :start_date => "12-12-12", 
                                                    :end_date => "12-12-12",
                                                    :start_time => "10:10", 
                                                    :end_time => "12:30", 
                                                    :paid => true, 
                                                    :amount => "2000"} }
        expect(response.content_type).to include("text/html")
        end

    end
end