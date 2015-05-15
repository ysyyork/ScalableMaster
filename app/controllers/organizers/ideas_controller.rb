class Organizers::IdeasController < Organizers::BaseController

  def index
    if participant_signed_in?
      @participant = Participant.find(current_participant[:id])
      tags = @participant.tags
    elsif organizer_signed_in?
      @organizer = Organizer.find(current_organizer[:id])
      tags = @organizer.tags
    else 
      flag = 1
    end
      
    @ideas = []
    idea_id = []
    if flag != 1
      tags.each do |tag|
        idea_tmp = Idea.joins(:tags).where('tags.id = ?', tag)

        idea_tmp.each do |idea|
          if !idea_id.include? idea.id
            idea_id << idea.id
            @ideas << idea
          end
        end
      end 
    end

    if @ideas.nil? || @ideas.length==0
      @ideas = Idea.all
    end
  end


end