module UserSubmitted
  class Collection < ActiveRecord::Base
    self.table_name = "user_submitted_collections"
    before_save do
      if self.identifier.present?
        self.identifier = self.identifier.parameterize
      else
        self.identifier = nil
      end
    end

    has_many :contents, -> { where.not(status: Content.statuses[:temp]).order(id: :desc) }

  end
end
