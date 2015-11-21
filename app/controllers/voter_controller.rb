class VoterController < ApplicationController
  def index
    @links = Link.all
  end

  def upvote

    @links = Link.all

    @upvoter = User.find(params[:id])
    @link = Link.find(params[:link_id])
    unless @link.vote.include?(@upvoter)

      if @who_voted.include?(@upvoter)
        @links.each do |link|
          link.vote.delete(@upvoter)
          link.save
        end
      end
      @link.vote.push(@upvoter)
      @who_voted.push(@upvoter)
    end
    @link.save
    # @links = Link.all
    #
    # @links.each do |link|
    #   link.vote.clear
    #   link.save
    # end



  end

end
