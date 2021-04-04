class SchedulesController < ApplicationController
  
  def index
    @schedules = Schedule.order("start_date")
  end

  def new
    @schedule = Schedule.new
  end

  def create
    @schedule = Schedule.new(params.require(:schedule).permit(:title, :start_date, :end_date, :all_day, :content))
    if @schedule.save
      flash[:notice] = "スケジュールを新規登録しました"
      redirect_to :schedules
    else
      flash[:alert] = "スケジュールの新規登録に失敗しました"
      render "new"
    end
  end

  def show
    @schedule = Schedule.find(params[:id])
  end

  def edit
    @schedule = Schedule.find(params[:id])
  end

  def update
    @schedule = Schedule.find(params[:id])
    if @schedule.update(params.require(:schedule).permit(:title, :start_date, :end_date, :all_day, :content))
      flash[:notice] = "「#{@schedule.title}」のスケジュールを更新しました"
      redirect_to :schedules
    else
      flash[:alert] = "スケジュールの更新に失敗しました"
      render "edit"
    end
  end

  def destroy
    @schedule = Schedule.find(params[:id])
    @schedule.destroy
    flash[:notice] = "「#{@schedule.title}」のスケジュールをを削除しました"
    redirect_to :schedules
  end

end
