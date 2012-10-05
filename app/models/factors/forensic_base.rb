module Factors
  class ForensicBase < Base
    def method_url(method)
      "http://www.busbender.com/dangerzone/tools/trip_data.php?car=#{vehicle_vin}&function=#{method}"
    end
  end
end