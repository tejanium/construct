class ProjectsController < ApplicationController
  before_filter :project, :only => [:show, :edit, :update, :destroy]
  def index
    @projects = Project.all
  end
  
  def show
    redirect_to project_builds_path(@project)
  end
  
  def update
    if @project.update_attributes(params[:project])
      flash[:success] = "Project has been updated."
      redirect_to project_path
    else
      flash[:error] = "Project could not be updated."
      render :action => "edit"
    end
  end
  
  def github
    Build.start(JSON.parse(params[:payload]))
    render :nothing => true
  end
  
  private
  
  def project
    @project = Project.find(params[:id])
  end
  
end