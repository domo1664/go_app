class HomeController < ApplicationController
  # This is where you could load a users trips/monuments when they log in
  # if user_signed_in?
    # get their id with the current_user method
    # Then do @monuments/@trips = Trips.where (user.id = id etc etc)
    def index
      @monuments = Monument.all
    end

    def show
      @monument = Monument.find(params[:id])
    end

    def create
      home = params['home']
      city = home['city']
      @url = "https://maps.googleapis.com/maps/api/place/textsearch/json?query=monuments+in+"+city+"&key=AIzaSyAaTxKO83nQMSzEMq5T-WqU9thoXryHcaM"
      @response = HTTParty.get(@url)
      mon_name = params[:mon][:monu]
      address = params[:mon][:address]
      pic = params[:mon][:pic]
      puts mon_name, address, pic
      render 'new'
    end

    def new
      @response
    end

    def update

    end

    def destroy

    end
end
