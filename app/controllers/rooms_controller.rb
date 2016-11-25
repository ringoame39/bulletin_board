class RoomsController < ApplicationController
  before_action :set_room, only: [:show, :edit, :update, :destroy]

  # GET /rooms
  # GET /rooms.json
  def index
    @rooms = Room.all
  end

  # GET /rooms/1
  # GET /rooms/1.json
  def show
    if params[:id]
      @chats = search_chats(params[:id])
    else
      @chats = search_chats(params[:format])
    end
  end

  # GET /rooms/new
  def new
    @room = Room.new
  end

  # GET /rooms/1/edit
  def edit
  end

  def chat
     @chat = Chat.create(message: params[:messagebox])
     RoomChat.create(room_id: params[:room_id], chat: @chat)
     redirect_to :back
  end

  # POST /rooms
  # POST /rooms.json
  def create
    @room = Room.new(room_params)
    respond_to do |format|
      if @room.save
        format.html { redirect_to @room, notice: 'Room was successfully created.' }
        format.json { render :show, status: :created, location: @room }
      else
        format.html { render :new }
        format.json { render json: @room.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /rooms/1
  # PATCH/PUT /rooms/1.json
  def update
    respond_to do |format|
      if @room.update(room_params)
        format.html { redirect_to @room, notice: 'Room was successfully updated.' }
        format.json { render :show, status: :ok, location: @room }
      else
        format.html { render :edit }
        format.json { render json: @room.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rooms/1
  # DELETE /rooms/1.json
  def destroy
    @room.destroy
    respond_to do |format|
      format.html { redirect_to rooms_url, notice: 'Room was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  def join_room
  ur = UserRoom.find_by(user_id: session[:user_id],room_id: params[:format])
    unless ur
      userroom = UserRoom.create(
        user_id: session[:user_id],
        room_id: params[:format])
      @room = userroom.room
      @chats = Room.find_by(id: params[:format]).chats
    else
      @room = ur.room
      @chats = Room.find_by(id: params[:format]).chats
    end
    render 'show'
  end
  private

    def search_chats(id)
      return Room.find_by(id: id).chats
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_room
      @room = Room.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def room_params
      params.require(:room).permit(:title, :description, :icon)
    end
end
