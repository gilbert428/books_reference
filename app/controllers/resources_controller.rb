class ResourcesController < ApplicationController
  def index
    @resources = Resource.page(params[:page]).per(10)
  end
end
