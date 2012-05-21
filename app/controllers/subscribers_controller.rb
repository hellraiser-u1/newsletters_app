class SubscribersController < ApplicationController
  # GET /subscribers
  # GET /subscribers.json
  def index
    @subscribers = Subscriber.all

    @subscribers.each do |s|
      SubscribersMailer.weekly_newsletter(s).deliver
    end
      
    #respond_to do |format|
    #  format.html # index.html.erb
    #  format.json { render json: @subscribers }
    #end

      flash[:success] = "Newsletters sent!"
      redirect_to root_path
  end

  # GET /subscribers/1
  # GET /subscribers/1.json
  def show
    @subscriber = Subscriber.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @subscriber }
    end
  end

  # GET /subscribers/new
  # GET /subscribers/new.json
  def new
    @subscriber = Subscriber.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @subscriber }
    end
  end

  # GET /subscribers/1/edit
  def edit
    @subscriber = Subscriber.find(params[:id])
  end

  def create
    @subscriber = Subscriber.new(params[:subscriber])
    if @subscriber.save
      UserMailer.subscription_confirmation(@subscriber,'https://floating-sky.herokuapp.com').deliver
      
      #SubscribersMailer.weekly_newsletter(@subscriber).deliver
      
      #@subs = Subscriber.all
      #SubscribersMailer.weekly_newsletter(@subs).deliver
      
      flash[:success] = "Thank you for subscribing to our Newsletter!"
      redirect_to root_path
    else
      render 'new'
    end
  end

  # PUT /subscribers/1
  # PUT /subscribers/1.json
  def update
    @subscriber = Subscriber.find(params[:id])

    respond_to do |format|
      if @subscriber.update_attributes(params[:subscriber])
        format.html { redirect_to @subscriber, notice: 'Subscriber was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @subscriber.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /subscribers/1
  # DELETE /subscribers/1.json
  def destroy
    @subscriber = Subscriber.find(params[:id])
    @subscriber.destroy

    respond_to do |format|
      format.html { redirect_to subscribers_url }
      format.json { head :no_content }
    end
  end
  
  
  #def send
  #  @subscribers = Subscriber.find_by_sql "SELECT name, email FROM Users WHERE subscription = True"
  #  
  #  MyMailer.send_newsletters(@subscribers).deliver
  #  
  #  flash[:success] = "Newsletters have been sent!"
  #  redirect_to root_path
  #end
  
  
end
