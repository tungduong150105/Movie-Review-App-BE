class PersonController < ApplicationController
  before_action :authenticate

  def get
    @person = Person.where(user_id: current_user.id)
    render json: { message: 'success', person: @person }
  end

  def create
    @person = Person.new(person_params)
    @person.user_id = current_user.id
    if @person.save
      render json: { message: 'Success' }, status: :created
    else
      render json: { message: 'Error' }, status: :unauthorized
    end
  end

  def delete
    @person = Person.find_by(person_id: params[:person_id], user_id: current_user.id)
    if @person.delete
      render json: { message: 'Success' }, status: :ok
    else
      render json: { message: 'Error' }, status: :unauthorized
    end
  end

  def is_in_favorite
    @person = Person.find_by(user_id: current_user.id, person_id: params[:person_id])
    if @person
      render json: { message: 'success' }, status: :ok
    else
      render json: { message: 'not found' }, status: :not_found
    end
  end

  private

  def person_params
    params.permit(:person_id)
  end
end
