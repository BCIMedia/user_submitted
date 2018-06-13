require "user_submitted/engine"

module UserSubmitted
  class << self
    attr_accessor :configuration
  end

  def self.configure
    self.configuration ||= Configuration.new
    yield(configuration)
  end
  class Configuration
    attr_accessor :s3_directory

    def initialize
      @s3_directory = "user_submitted_storage"
    end
  end
end
