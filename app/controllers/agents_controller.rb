class AgentsController < ApplicationController
  def index
    @agents = Agent.all
  end
  def show
    @agent = Agent.find_by(id: params[:id])
    if @agent.nil?
      redirect_to agents_path, alert: 'Agent not found'
    end
  end
end
