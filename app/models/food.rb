class Food < ActiveRecord::Base
  def self.search(search)
    if search
      where('name LIKE ?', "%#{search}%")
    else
      Food.all
    end
  end
end
