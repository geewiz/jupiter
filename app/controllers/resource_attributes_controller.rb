# frozen_string_literal: true

class ResourceAttributesController < ApplicationController
  before_action :set_resource_attribute,
                only: %i[show edit update destroy]

  # GET /resource_attributes
  def index
    @resource_attributes = ResourceAttribute.all
  end

  # GET /resource_attributes/1
  def show; end

  # GET /resource_attributes/new
  def new
    @resource_attribute = ResourceAttribute.new
  end

  # GET /resource_attributes/1/edit
  def edit; end

  # POST /resource_attributes
  def create
    @resource_attribute = ResourceAttribute.new(resource_attribute_params)

    if @resource_attribute.save
      redirect_to @resource_attribute,
                  notice: "Resource attribute was successfully created."
    else
      render :new
    end
  end

  # PATCH/PUT /resource_attributes/1
  def update
    if @resource_attribute.update(resource_attribute_params)
      redirect_to @resource_attribute,
                  notice: "Resource attribute was successfully updated."
    else
      render :edit
    end
  end

  # DELETE /resource_attributes/1
  def destroy
    @resource_attribute.destroy
    redirect_to resource_attributes_url,
                notice: "Resource attribute was successfully destroyed."
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_resource_attribute
    @resource_attribute = ResourceAttribute.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def resource_attribute_params
    params.require(:resource_attribute).
      permit(:resource, :resource_type_attribute, :value)
  end
end
