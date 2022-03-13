class ReadsController < ApplicationController
    after_action :read_file, only: [:create]
    def new 
        Read.new
    end
    def create
        @read = Read.create(file: params[:file])
        redirect_to root_path
    end
    def read_file
        content = File.readlines(ActiveStorage::Blob.service.path_for(@read.file.key))
        for i in(1..content.length-1)
            lines = content[i].split("\t")
            ActiveRecord::Base.transaction do
                Buyer.create(name: lines[0])
                Item.create(item_detail: lines[1],item_prize: lines[2],total_items: lines[3])
                Seller.create(address: lines[4],name: lines[5])
            end
        end
    end
    def index
        @buyers = Buyer.all
        @items = Item.all
        @sellers = Seller.all
    end
end
