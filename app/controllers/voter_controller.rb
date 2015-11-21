class VoterController < ApplicationController
  def index
    @links = Link.all
  end

  def upvote

    @links = Link.all
    @upvoter = User.find(params[:id])

    if Admin.first == nil
      admin = Admin.new
      admin.who_voted.push(@upvoter)
      admin.option = 1
    else
      admin = Admin.first
      admin.who_voted.push(@upvoter)
    end

    admin.save



    @link = Link.find(params[:link_id])
    unless @link.vote.include?(@upvoter)

      if admin.who_voted.include?(@upvoter)
        @links.each do |link|
          link.vote.delete(@upvoter)
          link.save
        end
      end
      @link.vote.push(@upvoter)


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
