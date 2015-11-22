class VoterController < ApplicationController
  def index
    @links = Link.all
  end

  def upvote

    @links = Link.all
    @upvoter = User.find(params[:id])

    @upvoter_name = @upvoter.name

    if Admin.first == nil
      admin = Admin.new
      admin.who_voted.push(@upvoter_name)
      admin.option = 1
    else
      admin = Admin.first
      admin.who_voted.push(@upvoter_name)
    end

    admin.save


    @link = Link.find(params[:link_id])
    unless @link.vote.include?(@upvoter_name)

      if admin.who_voted.include?(@upvoter_name)
        @links.each do |link|
          link.vote.delete(@upvoter_name)
          link.save
        end
      end
      @link.vote.push(@upvoter_name)
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
