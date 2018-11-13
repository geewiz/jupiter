# frozen_string_literal: true

class ProvidersController < ApplicationController
  before_action :set_provider, only: %i[show edit update destroy]

  # GET /providers
  def index
    @providers = Provider.all
  end

  # GET /providers/1
  def show; end

  # GET /providers/new
  def new
    @provider = Provider.new
  end

  # GET /providers/1/edit
  def edit; end

  # POST /providers
  def create
    @provider = Provider.new(provider_params)

    if @provider.save
      redirect_to @provider, notice: "Provider was successfully created."
    else
      render :new
    end
  end

  # PATCH/PUT /providers/1
  def update
    if @provider.update(provider_params)
      redirect_to @provider, notice: "Provider was successfully updated."
    else
      render :edit
    end
  end

  # DELETE /providers/1
  def destroy
    @provider.destroy
    redirect_to providers_url, notice: "Provider was successfully destroyed."
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_provider
    @provider = Provider.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def provider_params
    params.require(:provider).permit(:name)
  end
end
