class HomeController < ApplicationController
  # This is where you could load a users trips/monuments when they log in
  # if user_signed_in?
    # get their id with the current_user method
    # Then do @monuments/@trips = Trips.where (user.id = id etc etc)
    def index
      if user_signed_in?
        @monuments = Monument.where(user_id: current_user.id)
      else

      end
    end

    def show
      @monument = Monument.find(params[:id])
    end

    def create
      home = params['home']
      @city = home['city']
      if @city != nil
        @url = "https://maps.googleapis.com/maps/api/place/textsearch/json?query=monuments+in+"+@city+"&key=AIzaSyBhppvWek2UfzL7YZMzKCP4VKwiJ5P1b-s"
        @response = HTTParty.get(@url)
        @store_city = @city
      else
        mon_name = home['name']
        address = home['address']
        pic = home['pic']
        city = home['cityName']
        mon_name = mon_name.to_s
        address = address.to_s
        pic = pic.to_s
        city = city.to_s
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
      mon = params['monument']
      monu = Monument.find_by(monument_name: mon['name'])
      monu.update(monument_name: mon['name'],
                      address: mon['address'],
                      image: mon['pic'],
                      comment: mon['comment'])
      redirect_to(:back)
    end

    def destroy
      Monument.destroy(params['id'])
      redirect_to(:back)
    end
end
