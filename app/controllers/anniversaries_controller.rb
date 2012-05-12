# -*- coding: utf-8 -*-
class AnniversariesController < ApplicationController
  # GET /anniversaries
  # GET /anniversaries.json
  def index
    pp current_user.id
    @anniversaries = Anniversary.find(:all, :conditions => ['user_id=?',current_user.id])

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
    @anniversary = Anniversary.new
    form = params[:anniversary]
    @anniversary.anniversary = form[:anniversary]
    @anniversary.description = form[:description]

    @anniversary.user_id = current_user.id
    last_anniversary = Anniversary.find(:all, :conditions => ['user_id', '1']).first
    if last_anniversary
      @anniversary.date = last_anniversary.date + 1.days
    else
      @anniversary.date = Date.today + 1.days
    end
    # FIXME 3rd parameter
    # tweet_body = "@%s は最高の幸せを噛み締めた。彼の1日は終わったのだ。 http://hoge.com/%s/%s" [@anniversary.user.twitter_id, @anniversary.user.twitter_id, @anniversary.id]
    tweet_body = "@ #{@anniversary.user.twitter_id} は最高の幸せを噛み締めた。そう、一日は終わったのだ。"
    tweet_result = current_user.tweet({:tweet_body => tweet_body, :user => current_user})
    @anniversary.tweet_id = tweet_result[:id].to_i

    respond_to do |format|
      if @anniversary.save
        format.html { redirect_to '/anniversaries', notice: 'Anniversary was successfully created.' }
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
