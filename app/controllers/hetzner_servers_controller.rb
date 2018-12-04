# frozen_string_literal: true

class HetznerServersController < ApplicationController
  before_action :set_hetzner_server, only: %i[show edit update destroy]

  # GET /hetzner_servers
  def index
    @hetzner_servers = HetznerServer.all
  end

  # GET /hetzner_servers/1
  def show; end

  # GET /hetzner_servers/new
  def new
    @hetzner_server = HetznerServer.new
  end

  # GET /hetzner_servers/1/edit
  def edit; end

  # POST /hetzner_servers
  def create
    @hetzner_server = HetznerServer.new(hetzner_server_params)

    if @hetzner_server.save
      redirect_to @hetzner_server,
                  notice: "Hetzner server was successfully created."
    else
      render :new
    end
  end

  # PATCH/PUT /hetzner_servers/1
  def update
    if @hetzner_server.update(hetzner_server_params)
      redirect_to @hetzner_server,
                  notice: "Hetzner server was successfully updated."
    else
      render :edit
    end
  end

  # DELETE /hetzner_servers/1
  def destroy
    @hetzner_server.destroy
    redirect_to hetzner_servers_url,
                notice: "Hetzner server was successfully destroyed."
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_hetzner_server
    @hetzner_server = HetznerServer.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def hetzner_server_params
    params.require(:hetzner_server).permit(:number, :name, :ipv4, :ipv6)
  end
end
