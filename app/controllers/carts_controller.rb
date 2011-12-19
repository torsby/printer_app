class CartsController < ApplicationController
  before_filter :initialize_cart
  # GET /carts
  # GET /carts.xml
  def index
    @carts = Cart.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @carts }
    end
  end

  # GET /carts/1
  # GET /carts/1.xml
  def show
    @cart = Cart.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @cart }
    end
  end
  def your_cart
    redirect_to :action => "show", :id => current_cart.id
  end

  # GET /carts/new
  # GET /carts/new.xml
  def new
    @cart = Cart.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @cart }
    end
  end

  # GET /carts/1/edit
  def edit
    @cart = Cart.find(params[:id])
  end

  # POST /carts
  # POST /carts.xml
  def create
    @cart = Cart.new(params[:cart])

    respond_to do |format|
      if @cart.save
        format.html { redirect_to(@cart, :notice => 'Cart was successfully created.') }
        format.xml  { render :xml => @cart, :status => :created, :location => @cart }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @cart.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /carts/1
  # PUT /carts/1.xml
  def update
    @cart = Cart.find(params[:id])

    respond_to do |format|
      if @cart.update_attributes(params[:cart])
        format.html { redirect_to(@cart, :notice => 'Cart was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @cart.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /carts/1
  # DELETE /carts/1.xml
  def destroy
      @cart = Cart.find(params[:id])
      @cart.destroy
      session[:cart_id] = nil

      respond_to do |format|
        format.html { redirect_to(products_url, :notice =>'Your cart is currently empty') }
        format.xml { head :ok }
    end
  end
end

def add
@cart= Cart.find(params[:id])
if request.xhr?
@item = @cart.add(params[:id])
flash.now[:cart_notice] = "Added <em>#{@item.manufacturer.title}</em>"
render :action => "add_with_ajax"
elsif request.post?
@item = @cart.add(params[:id])
flash[:cart_notice] = "Added <em>#{@item.cart.title}</em>"
redirect_to session[:return_to] || {:controller => "catalog"}
else
render
end
end

