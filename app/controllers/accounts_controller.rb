class AccountsController < ApplicationController

    def index
      @account = Account.new
      @records = Account.order("created_at DESC").paginate(:page => params[:page], :per_page => 5)
      @balance=Account.balance
      @debt=Account.debt
      @total=Account.total
      
    end

    def create
        @record = Account.create(account_params)
        if @record.valid?
            flash[:success] = "Your Record has been posted!"
        else
            flash[:alert] = "Woops! Looks like there has been an error!"
        end
        redirect_to root_path
    end


    def edit
        @record = Account.find(params[:id])
    end


    def update
        @record = Account.find(params[:id])
        if @record.update(account_params)
            flash[:success] = "The Record has been updated!"
            redirect_to root_path

        else
            flash[:alert] = "Woops! Looks like there has been an error!"
            redirect_to edit_path(params[:id])
        end
    end


    def destroy
        @record = Account.find(params[:id])
        @record.destroy
        flash[:success] = "The Record was successfully deleted!"
        redirect_to root_path
    end


    private


    def account_params
        params.require(:account).permit(:title,:date,:amount)
    end
end