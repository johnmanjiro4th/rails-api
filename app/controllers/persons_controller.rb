class PersonsController < ApplicationController
  # GET /persons
  def index
    if params[:e_name]
      @persons = Person.where(e_name: params[:e_name])
    elsif q = params[:q]
      @persons =
       Person.where('e_code LIKE?', "%#{q}%")
       .or(Person.where('e_name LIKE?', "%#{q}%"))
       .or(Person.where('local_station LIKE?', "%#{q}%"))
    else
      @persons = Person.all
    end
    render json: @persons
  end

  # GET /persons/1
  def show
    @person = Person.find(params[:id])
    render json: @person
  end

  #POST /persons
  def create
    @person = Person.new
    @person.e_code = params[:e_code]
    @person.e_name = params[:e_name]
    @person.local_station = params[:local_station]
    @person.save
  end

  #PUT //persons/1
  def update
    @person = Person.find(params[:id])
    @person.e_code = params[:e_code]
    @person.e_name = params[:e_name]
    @person.local_station = params[:local_station]
    @person.save
  end

  #DELETE //persons/1
  def destroy
    @person = Person.find(params[:id])
    @person.destroy
  end
end
