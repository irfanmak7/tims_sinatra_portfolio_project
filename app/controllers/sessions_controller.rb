class SessionsController < ApplicationController

    get '/login' do
        erb :"sessions/login.html"
    end

    post '/sessions' do
        # login a user with this email
        login(params[:email])
        redirect '/items'
    end


    get '/logout' do
        logout!
    end


end