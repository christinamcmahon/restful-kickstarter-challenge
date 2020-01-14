class ProjectsController < ApplicationController
  before_action :find_project, only: [:edit, :update, :destroy, :show]

  # index
  def index
    @projects = Project.all
  end

  # new
  def new
    @project = Project.new
  end

  # create
  def create
    @project = Project.create(set_params)
    redirect_to project_path(@project)
  end

  # update
  def update
    @project.update(set_params)
    redirect_to project_path(@project)
  end

  # delete
  def destroy
    @project.delete
    redirect_to projects_path
  end

  private

  def set_params
    params.require(:project).permit(:title, :description)
  end

  def find_project
    @project = Project.find(params[:id])
  end
end
