class SubjectsController < ApplicationController
  def index
    @subjects = Subject
                  .left_joins(:books)
                  .group('subjects.id')
                  .order('COUNT(books.id) DESC')
  end

  def show
    @subject = Subject.find(params[:id])
  end
end
