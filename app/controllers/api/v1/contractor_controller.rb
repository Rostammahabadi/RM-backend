class Api::V1::ContractorController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    if authorize_request
      render json: ContractorSerializerSerializer.new(Contractor.all).serializable_hash 
    else
      render json: {data: {errors: "You must pass a valid token"}}, status: 403
    end
  end

  def update
    authorize_request
    name = params[:name]
    email = params[:email]
    hourly_rate = params[:hourly_rate]
    active = params[:active]
    specialty = params[:specialty]
    contractor = Contractor.find_by email: email
    if contractor
      contractor.update_attributes!({
          name: name,
          email: email,
          hourly_rate: hourly_rate,
          active: active,
          specialty: specialty,
      })
      render json: ContractorSerializerSerializer.new(contractor).serializable_hash
    else
      render json: {data: { errors: "Incorrect format"}}, status: 403
    end
  end

  def create
    name = params[:name]
    email = params[:email]
    hourly_rate = params[:hourly_rate].to_i
    specialty = params[:specialty]
    contractor = Contractor.new({
      name: name,
            email: email,
            hourly_rate: hourly_rate,
            active: true,
            specialty: specialty,
    })
    if contractor.save
      render json: {data: { contractor: contractor}}
    else
      render json: {data: { errors: contractor.errors.full_messages}}, status: 400
    end
  end

  def show
    id = params[:id]
    contractor = Contractor.find(id)
    if contractor
      render json: ContractorSerializerSerializer.new(contractor).serializable_hash
    else
      render json: {data: {errors: "Contractor not found"}}, status: 400
    end
  end

  private

  def authorize_request
    @current_user = AuthorizeRequest.call(request.headers)
  end

end