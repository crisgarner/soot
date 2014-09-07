class TestingSController < ApplicationController
  before_action :set_testing_, only: [:show, :edit, :update, :destroy]

  # GET /testing_s
  # GET /testing_s.json
  def index
    @testing_s = Testing.all
  end

  # GET /testing_s/1
  # GET /testing_s/1.json
  def show
  end

  # GET /testing_s/new
  def new
    @testing_ = Testing.new
  end

  # GET /testing_s/1/edit
  def edit
  end

  # POST /testing_s
  # POST /testing_s.json
  def create
    @testing_ = Testing.new(testing__params)

    respond_to do |format|
      if @testing_.save
        format.html { redirect_to @testing_, notice: 'Testing  was successfully created.' }
        format.json { render action: 'show', status: :created, location: @testing_ }
      else
        format.html { render action: 'new' }
        format.json { render json: @testing_.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /testing_s/1
  # PATCH/PUT /testing_s/1.json
  def update
    respond_to do |format|
      if @testing_.update(testing__params)
        format.html { redirect_to @testing_, notice: 'Testing  was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @testing_.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /testing_s/1
  # DELETE /testing_s/1.json
  def destroy
    @testing_.destroy
    respond_to do |format|
      format.html { redirect_to testing_s_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_testing_
      @testing_ = Testing.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def testing__params
      params[:testing_]
    end
end
