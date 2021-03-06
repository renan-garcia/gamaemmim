class LeadsController < ApplicationController
  before_action :set_lead, only: %i[show edit update destroy]
  before_action :authenticate_admin!, only: %i[index edit update destroy csv_list]

  # GET /leads
  # GET /leads.json
  def index
    @leads = []
    @leads_more_ip_filter = []
    Lead.all.order(:name).distinct.group_by(&:ip).each do |ip_leads|
      if ip_leads[1].size > 2
        @leads_more_ip_filter += ip_leads[1]
      else
        @leads += ip_leads[1]
      end
    end
  end

  def csv_list
    @options = :email, { name: { display_name: 'nome' } }, :ip, { created_at: { display_name: 'data_hora' } }
    @database = 'email,nome,ip,data_hora'
    Lead.all.each do |lead|
      @database << "\n"
      @database << "#{lead.email},#{lead.name},#{lead.ip},#{lead.created_at.strftime('%Y-%m-%d %H:%M:%S')}"
    end
  end

  # GET /leads/1
  # GET /leads/1.json
  def show; end

  # GET /leads/new
  def new
    @lead = Lead.new
  end

  # GET /leads/1/edit
  def edit; end

  # POST /leads
  # POST /leads.json
  def create
    @lead = Lead.new(lead_params)
    @lead.ip = request.remote_ip
    Lead.exists?(email: @lead.email) ? return : @lead.save
    respond_to do |format|
      format.js
    end
  end

  # PATCH/PUT /leads/1
  # PATCH/PUT /leads/1.json
  def update
    respond_to do |format|
      if @lead.update(lead_params)
        format.html { redirect_to @lead, notice: 'Lead was successfully updated.' }
        format.json { render :show, status: :ok, location: @lead }
      else
        format.html { render :edit }
        format.json { render json: @lead.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /leads/1
  # DELETE /leads/1.json
  def destroy
    @lead.destroy
    respond_to do |format|
      format.html { redirect_to leads_url, notice: 'Lead was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_lead
    @lead = Lead.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def lead_params
    params.require(:lead).permit(:name, :email)
  end
end
