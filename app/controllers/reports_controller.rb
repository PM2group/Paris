class ReportsController < ApplicationController
  skip_before_action :login_required
  skip_before_action :login_com_required
  skip_before_action :login_super_user_required
  protect_from_forgery :except => ["create"]
  # GET /reports
  # GET /reports.json
  def index
    @reports = Report.all
  end

  # GET /reports/1
  # GET /reports/1.json
  def show
  end

  # GET /reports/new
  def new
    @report = Report.new
  end

  # GET /reports/1/edit
  def edit
  end

  # POST /reports
  # POST /reports.json
  def create
    @report = Report.new
    @report.report_chat = params[:report_chat]
    @report.report_man = params[:report_man]
    @report.reported_man = params[:reported_man]
    if @report.save
      redirect_to chat_page_path(@report.report_chat)
    else
      redirect_to chat_page_path(@report.report_chat)
    end
  end

  # PATCH/PUT /reports/1
  # PATCH/PUT /reports/1.json
  def update
    respond_to do |format|
      if @report.update(report_params)
        format.html { redirect_to @report, notice: 'Report was successfully updated.' }
        format.json { render :show, status: :ok, location: @report }
      else
        format.html { render :edit }
        format.json { render json: @report.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reports/1
  # DELETE /reports/1.json
  def destroy
    report = Report.find(params[:id])
    report.destroy
    redirect_to super_users_url, notice: "確認しました"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_report
      @report = Report.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def report_params
      params.require(:report).permit(:report_chat, :reported_man, :report_man)
    end
end
