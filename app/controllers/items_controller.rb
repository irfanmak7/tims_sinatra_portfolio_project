class ItemsController < ApplicationController

    get '/items' do
        if !logged_in?
            redirect '/login'
        else
            "You are logged in as #{session[:email]}"
        end
    end

    get '/items/new' do
        # Check if a user is logged in
        if !logged_in?
            redirect '/login'   #Redirects user if they are NOT logged in
        else
            "A new post form"   # Renders page if user IS logged in
        end
    end

    get '/items/:id/edit' do
        # Check if a user is logged in
        if !logged_in?
            redirect '/login'   #Redirects user if they are NOT logged in
        else
            "A edit post form"   # Renders page if user IS logged in
        end
    end

end