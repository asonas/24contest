class AnniversariesController < ApplicationController
  # GET /anniversaries
  # GET /anniversaries.json
  def index
    @anniversaries = Anniversary.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @anniversaries }
    end
  end

  # GET /anniversaries/1
  # GET /anniversaries/1.json
  def show
    @anniversary = Anniversary.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @anniversary }
    end
  end

  # GET /anniversaries/new
  # GET /anniversaries/new.json
  def new
    @anniversary = Anniversary.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @anniversary }
    end
  end

  # GET /anniversaries/1/edit
  def edit
    @anniversary = Anniversary.find(params[:id])
  end

  # POST /anniversaries
  # POST /anniversaries.json
  def create
    @anniversary = Anniversary.new(params[:anniversary])

    respond_to do |format|
      if @anniversary.save
        format.html { redirect_to @anniversary, notice: 'Anniversary was successfully created.' }
        format.json { render json: @anniversary, status: :created, location: @anniversary }
      else
        format.html { render action: "new" }
        format.json { render json: @anniversary.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /anniversaries/1
  # PUT /anniversaries/1.json
  def update
    @anniversary = Anniversary.find(params[:id])

    respond_to do |format|
      if @anniversary.update_attributes(params[:anniversary])
        format.html { redirect_to @anniversary, notice: 'Anniversary was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @anniversary.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /anniversaries/1
  # DELETE /anniversaries/1.json
  def destroy
    @anniversary = Anniversary.find(params[:id])
    @anniversary.destroy

    respond_to do |format|
      format.html { redirect_to anniversaries_url }
      format.json { head :no_content }
    end
  end
end
