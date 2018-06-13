module UserSubmitted
  class Collection < ActiveRecord::Base
    self.table_name = "user_submitted_collections"

    has_many :contents, -> { order(id: :desc) }

  end
end
