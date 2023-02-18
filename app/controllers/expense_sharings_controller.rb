# frozen_string_literal: true

class ExpenseSharingsController < ApplicationController
  before_action :authenticate_user!

  def index
    @shared_expenses = current_user.shared_expenses.includes(:sender)
    @sended_expenses = current_user.sended_expenses.includes(:recipient)
  end

  def show
    @sender = ExpenseSharing.find(params[:id]).sender
  end

  def new
    @expense_sharing = current_user.sended_expenses.new
    @users_list = users_list_for_share
  end

  def create
    @expense_sharing = current_user.sended_expenses.new(expense_sharing_params)
    return unless @expense_sharing.save

    redirect_to expenses_path, notice: I18n.t('expense_sharings.messages.successfully_shared')
  end

  def destroy
    @expense_sharing = ExpenseSharing.find(params[:id])
    return unless @expense_sharing

    @expense_sharing.destroy
    redirect_to expense_sharings_path, notice: I18n.t('expense_sharings.messages.successfully_destroy')
  end

  private

  def users_list_for_share
    User.where.not(id: current_user.followers.pluck(:id).push(current_user.id))
  end

  def expense_sharing_params
    params.require(:expense_sharing).permit(:recipient_id)
  end
end
