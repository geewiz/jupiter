# frozen_string_literal: true

class ResourceTypeAttributesController < ApplicationController
  before_action :set_resource_type_attribute,
                only: %i[show edit update destroy]

  # GET /resource_type_attributes
  def index
    @resource_type_attributes = ResourceTypeAttribute.all
  end

  # GET /resource_type_attributes/1
  def show; end

  # GET /resource_type_attributes/new
  def new
    @resource_type_attribute = ResourceTypeAttribute.new
  end

  # GET /resource_type_attributes/1/edit
  def edit; end

  # POST /resource_type_attributes
  def create
    @resource_type_attribute =
      ResourceTypeAttribute.new(resource_type_attribute_params)

    if @resource_type_attribute.save
      redirect_to @resource_type_attribute,
                  notice: "Resource type attribute was successfully created."
    else
      render :new
    end
  end

  # PATCH/PUT /resource_type_attributes/1
  def update
    if @resource_type_attribute.update(resource_type_attribute_params)
      redirect_to @resource_type_attribute,
                  notice: "Resource type attribute was successfully updated."
    else
      render :edit
    end
  end

  # DELETE /resource_type_attributes/1
  def destroy
    @resource_type_attribute.destroy
    redirect_to resource_type_attributes_url,
                notice: "Resource type attribute was successfully destroyed."
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_resource_type_attribute
    @resource_type_attribute = ResourceTypeAttribute.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def resource_type_attribute_params
    params.require(:resource_type_attribute).permit(:name, :resource)
  end
end
