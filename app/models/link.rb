class Link < ActiveRecord::Base
  serialize :vote, Array
end
