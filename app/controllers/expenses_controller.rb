# frozen_string_literal: true

class ExpensesController < ApplicationController
  before_action :authenticate_user!
  def index
    @expenses = ExpensesQuery.query(expenses_query_params).decorate
  end

  def show
    @expense = current_user.expenses.find(params[:id])
  end

  def new
    @expense ||= current_user.expenses.new
  end

  def edit
    @expense = current_user.expenses.find(params[:id])
  end

  def create
    @expense = current_user.expenses.new(expense_params)
    if @expense.save
      redirect_to expenses_path, notice: I18n.t('expenses.messages.successfully_created')
    else
      render :new
    end
  end

  def update
    @expense = current_user.expenses.find(params[:id])
    if @expense.update(expense_params)
      redirect_to expenses_path, notice: I18n.t('expenses.messages.successfully_updated')
    else
      render action: 'edit'
    end
  end

  def destroy
    @expense = current_user.expenses.find(params[:id])
    @expense.destroy
    redirect_to expenses_path, notice: I18n.t('expenses.messages.successfully_destroyed')
  end

  private

  def expenses_query_params
    expenses_params.merge(base_scope: current_user.expenses)
  end

  def expenses_params
    params.permit(:value, :amount, :category_id, :created_at, :sort)
  end

  def expense_params
    params.require(:expense).permit(:name, :value, :amount, :description, :category_id)
  end
end
