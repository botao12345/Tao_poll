class MasterController < ApplicationController
  def index
    @links = Link.all
  end

  def reset
    @links = Link.all

    @links.each do |link|
      link.vote.clear
      link.save
    end

    redirect_to master_path
  end
end

