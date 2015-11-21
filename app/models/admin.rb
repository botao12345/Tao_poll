class Admin < ActiveRecord::Base
  serialize :who_voted, Array

end
