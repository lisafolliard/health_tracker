class Exercise < ActiveRecord::Base
    def self.search(search)
      if search
        where('name LIKE ?', "%#{search}%")
      else
        Exercise.all
      end
    end
end
