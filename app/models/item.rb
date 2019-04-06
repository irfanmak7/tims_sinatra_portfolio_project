class Item < ActiveRecord::Base
    belongs_to :user

    def self.validate(params)
        return !params[:name].empty? && !params[:serial_number].empty?
    end

end