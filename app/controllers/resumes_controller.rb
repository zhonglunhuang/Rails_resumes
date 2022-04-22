class ResumesController < BaseController
# rescue_from ActiveRecord::RecordNotFound , with: :not_found
  before_action :find_resume, only: [:show, :update,:destroy]
  before_action :find_my_resume, only: [:pin]
  before_action :authenticate_user?, except: [:index, :show, :my]

  def index
    @resumes = Resume.all
    # flash[:notice] = "QQ"
    @current_user = current_user
  end

  def my
    @resumes = current_user.resumes
  end
  
  def new

    @resume = Resume.new
  end
  def create
    # @resume = Resume.new(resume_params)
    # @resume.users_id =  

    @resume = current_user.resumes.new(resume_params)
    if @resume.save
      redirect_to resumes_path, notice: "新增成功"
    else
      render :new
    end
  end

  def show
    @current_user = current_user
    begin
      find_resume
    rescue => exception
      redirect_to "/", notice: "不要亂來"
    end
  end

  def destroy
    @resume.delete
    redirect_to resumes_path, notice: "已刪除"
  end

  def edit
    begin
      find_my_resume
    rescue => exception
      redirect_to "/", notice: "不要亂來"
    end
  end

  def update
  
    if @resume.update(resume_params)
      redirect_to resumes_path, notice: "更新成功"
    else 
      render :edit
    end
  end

  def pin
    # byebug
    current_user.resumes.update_all(pinned: false)
    @resume.update(pinned: true)
    redirect_to resumes_my_path , notice: "已設定預設履歷成功"
  end
  

  private
    def resume_params
      params.require(:resume).permit(:title, :context, :status, :photo)
    end
    def not_found
      render file: "#{Rails.root}/public/404.html",
            status: 404
    end
    def find_resume
      @resume = Resume.friendly.find(params[:id])
    end

    def find_my_resume
      # @resume = Resume.find_by!(id: params[:id], user_id: current_user.id)
      @resume = current_user.resumes.friendly.find(params[:id])
    end
    
end
