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

    def edit

    end

    def create
      home = params['home']
      monument = home['monument_name']
      @url = "https://maps.googleapis.com/maps/api/place/textsearch/json?query=monuments+in+"+monument+"&key=AIzaSyAtothoHxQt87NlqSMvHwP6Q6MJ28vP0Y4"
      @response = HTTParty.get(@url)
      @response['results'].each do |res|
        @temp = res['formatted_address']
      end
      render 'new'
    end

    def new
      puts @new = @temp
    end

    def update

    end

    def destroy

    end
end
