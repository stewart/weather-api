require 'chronic'

module Weather
  class Utils

    # Attempts to convert passed text into a Time object
    #
    # Returns a Time object or nil
    def self.parse_time(text)
      begin
        Time.parse(text)
      rescue ArgumentError
        Chronic.parse(text)
      end
    end
  end
end
