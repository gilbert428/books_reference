class SearchController < ApplicationController
  def index
    @results = case params[:filter]
               when 'books'
                 Book.where('title LIKE ?', "%#{params[:q]}%")
               when 'agents'
                 Agent.where('name LIKE ?', "%#{params[:q]}%")
               when 'resources'
                 Resource.where('uri LIKE ?', "%#{params[:q]}%")
               when 'subjects'
                 Subject.where('name LIKE ?', "%#{params[:q]}%")
               else
                 []
               end
  end
end
