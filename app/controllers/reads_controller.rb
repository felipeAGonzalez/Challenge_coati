class ReadsController < ApplicationController
    def new 
        Read.new
    end
    def create
        @read = Read.create(file: params[:file])
        redirect_to root_path
    end
    def index
        @buyers = Buyer.all
        @items = Item.all
        @sellers = Seller.all
    end
end
