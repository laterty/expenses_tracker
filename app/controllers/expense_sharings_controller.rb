# frozen_string_literal: true

class ExpenseSharingsController < ApplicationController
  before_action :authenticate_user!

  def index
    @shared_expenses = current_user.shared_expenses
  end

  def show
    @sender = ExpenseSharing.find(params[:id]).sender
  end

  def create
    @expense_sharing = current_user.sended_expenses.new(expense_sharing_params)
  end

  def destroy
    @expense_sharing = ExpenseSharing.find(params[:id])
    return unless @expense_sharing

    @expense_sharing.destroy
    redirect_to expense_sharing_path, notice: I18n.t('expense_sharings.messages.successfully_destroy')
  end

  private

  def expense_sharing_params
    params.permit(:expense_sharing).require(:recipient_id)
  end
end
