require 'rest-client'
class StocksController < ApplicationController
  before_action :set_stock, only: [:show, :edit, :update, :destroy]

  # GET /stocks
  # GET /stocks.json
  def index
    @stocks = Stock.all
    @icarus_stocks = Stock.icarus #Stock.all
    @rising_stocks = Stock.rising #Stock.all
    @bargain_stocks = Stock.bargain #Stock.all
    @caution_stocks = Stock.caution #Stock.all
  end

  # GET /stocks/1
  # GET /stocks/1.json
  def show
    @stock = Stock.find(params[:id])
    ticker = @stock.symbol
    name = @stock.name
    @data = Quandl::Dataset.get('WIKI/' + ticker).data(params: { limit: 1 }).first
    @price_history = Quandl::Dataset.get('WIKI/' + ticker).data(params: { limit: 180})
    url = 'https://newsapi.org/v2/everything?q=' + name + '&from=2017-12-01&sortBy=popularity&apikey=d691cab4303d4289893580dedb78a770'
    @body = JSON.parse(RestClient.get(url))


     # render json: data.column_names

#      render json: data.data_fields

  end

  def show_industries
   @industry = Industry.find(params[:id])
  end


  # GET /stocks/new
  def new
    @stock = Stock.new
  end

  # GET /stocks/1/edit
  def edit
  end

  # POST /stocks
  # POST /stocks.json
  def create
    @stock = Stock.new(stock_params)

    respond_to do |format|
      if @stock.save
        format.html { redirect_to @stock, notice: 'Stock was successfully created.' }
        format.json { render :show, status: :created, location: @stock }
      else
        format.html { render :new }
        format.json { render json: @stock.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /stocks/1
  # PATCH/PUT /stocks/1.json
  def update
    respond_to do |format|
      if @stock.update(stock_params)
        format.html { redirect_to @stock, notice: 'Stock was successfully updated.' }
        format.json { render :show, status: :ok, location: @stock }
      else
        format.html { render :edit }
        format.json { render json: @stock.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /stocks/1
  # DELETE /stocks/1.json
  def destroy
    @stock.destroy
    respond_to do |format|
      format.html { redirect_to stocks_url, notice: 'Stock was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_stock
      @stock = Stock.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def stock_params
      params.require(:stock).permit(:symbol, :name, :industry, :rank, :mom)
    end

end
