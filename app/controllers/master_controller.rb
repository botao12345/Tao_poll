class MasterController < ApplicationController
  def index
    @links = Link.all
    end
  end

