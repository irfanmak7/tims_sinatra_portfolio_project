class ItemsController < ApplicationController

    get "/items" do
        redirect_if_not_logged_in
        @items = Item.all
        erb :'items/index'
    end

    post "/items" do
        redirect_if_not_logged_in
    
        unless Item.validate(params)
            redirect "/items/new"
        end
        Item.create(params)
        redirect "/items"
    end

    get "/items/new" do
        redirect_if_not_logged_in
        erb :'items/new'
    end

    get "/items/:id" do
        redirect_if_not_logged_in
        @item = Item.find(params[:id])
        erb :'items/show'
    end
    

    
    get "/items/:id/edit" do
        redirect_if_not_logged_in
        @item = Item.find(params[:id])
        erb :'items/edit'
    end

    patch "/items/:id" do
        redirect_if_not_logged_in
        @item = Item.find(params[:id])
        @item.update(name: params[:name], serial_number: params[:serial_number])
        
        redirect "/items"
    end

    delete "/items/:id/delete" do
        redirect_if_not_logged_in
        @item = Item.find(params[:id])
        @item.destroy
        redirect '/items'
    end
    
end