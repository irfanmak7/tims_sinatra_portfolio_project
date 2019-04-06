class UsersController < ApplicationController

    get '/users/:id' do
        if !logged_in?
          redirect '/items'
        end
    
        @user = User.find(params[:id])
        if !@user.nil? && @user == current_user
          erb :'users/show'
        else
          redirect '/items'
        end
    end
    
    get '/signup' do
        if !session[:user_id]
            erb :'users/new'
        else
            redirect '/items'
        end
    end

    post '/signup' do 
        if params[:email] == "" || params[:password] == ""
          redirect to '/signup'
        else
          @user = User.create(:name => params[:name], :email => params[:email],:password => params[:password])
          session[:user_id] = @user.id
          redirect '/items'
        end
    end

    get '/login' do 
        if !session[:user_id]
          erb :'users/login'
        else
          redirect '/items'
        end
    end
    
      post '/login' do
        user = User.find_by(:email => params[:email])
        if user && user.authenticate(params[:password])
          session[:user_id] = user.id
          redirect "/items"
        else
          redirect to '/signup'
        end
      end

      get '/logout' do
        logout!
      end


end