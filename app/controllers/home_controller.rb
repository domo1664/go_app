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
      @city = home['city']
      if @city != nil
        @url = "https://maps.googleapis.com/maps/api/place/textsearch/json?query=monuments+in+"+@city+"&key=AIzaSyAaTxKO83nQMSzEMq5T-WqU9thoXryHcaM"
        @response = HTTParty.get(@url)
        @store_city = @city
      else
        mon_name = home['name']
        address = home['address']
        pic = home['pic']
        city = home['cityName']
        puts mon_name = mon_name.to_s
        puts address = address.to_s
        puts pic = pic.to_s
        puts city = city.to_s
        m = Monument.new
        t = Trip.new
        m.monument_name = mon_name
        m.address = address
        m.image = pic
        m.comment = ""
        u = User.find(current_user.id)
        m.user = u
        t.city_name = city
        t.user = u
        t.save
        m.trip = t
        m.save
      end
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
