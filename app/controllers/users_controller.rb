class UsersController < ApplicationController
  # GET /users
  # GET /users.json
  def index
    @users = User.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
    end
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/new
  # GET /users/new.json
  def new
    @user = User.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(params[:user])

    User.transaction do

    if @user.save
      UserMailer.registration_confirmation(@user,'https://floating-sky.herokuapp.com').deliver

      if @user.subscription = "true"
        Subscriber.find_or_create_by_name_and_email(@user.name,@user.email)
      end

      sign_in @user
      
      flash[:success] = "Welcome to Application X!"
      redirect_to @user
    else
      render 'new'
    end
    end

    
  def unsubscribe
    @user = User.find(params[:id])
    
    User.transaction do
      @user.subscription = "false"
      @user.save

      @subscriber = Subscriber.where(:name => @user.name, :email => @user.email)
      
      #User.find(params[:user_id])
      #:user_id => @user.id

      #Client.where("orders_count = ?", params[:orders])
      
      #Student.where(params[:student])
      @subscriber.destroy

      flash[:success] = "You have been unsubscribed from our weekly newsletter!"

  end

  # PUT /users/1
  # PUT /users/1.json
  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to @user, notice: 'Your profile was updated successfully.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end
end
