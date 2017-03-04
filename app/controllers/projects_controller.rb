class ProjectsController < ApplicationController
  before_action :find_project, only: [:show, :edit, :update, :destroy]
  def index
    @projects = Project.all.order("created_at desc").paginate(page: params[:page], per_page: 2)
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new project_params
    if @project.save
      redirect_to @project, notice: "Nice! Project saved."
    else
      render 'new'
    end

    def show
    end

    def edit
    end

    def update
      if @project.update project_params
        redirect_to @project, notice: "Nice! It's updated"
      else
        render 'edit'
      end
    end

    def destroy
      @project.destroy
      redirect_to projects_path
    end
  end

  private

  def find_project
    @project = Project.friendly.find(params[:id])
  end

  def project_params
    params.require(:project).permit(:title, :description, :link, :slug)
  end
end
