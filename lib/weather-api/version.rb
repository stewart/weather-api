module Weather
  class Version

    # The current major version number
    #
    # Returns an int
    def self.major
      0
    end

    # The current minor version number
    #
    # Returns an int
    def self.minor
      0
    end

    # The current patch version number
    #
    # Returns an int
    def self.patch
      1
    end

    # The current pre version number
    #
    # Returns an int
    def self.pre
      nil
    end

    # Bundles up the version number into a string
    #
    # Returns the current version number as a string
    def self.to_s
      [major, minor, patch, pre].compact.join('.')
    end
  end
end
