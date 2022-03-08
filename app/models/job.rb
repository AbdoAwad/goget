class Job < ApplicationRecord
    geocoded_by:pickup_address, latitude: :pickup_latitude, longitude: :pickup_longitude
    after_validation :geocode

    # geocoded_by:drop_off_address, latitude: :drop_off_latitude, longitude: :drop_off_longitude 

    def pickup_address 
        [pickup_street, pickup_city, pickup_postcode, pickup_state].compact.join(", ")
    end
    
    # def drop_off_address
    #     [drop_off_street, drop_off_city, drop_off_postcode, drop_off_state].compact.join(", ")
    # end
    belongs_to :user
end
