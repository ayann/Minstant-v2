class OpenfireUsersController < ApplicationController
    before_filter :authenticate_mi_user!
    before_action :set_openfire_user, only: [:show, :edit, :update, :destroy]
    layout "dashboard"

    # GET /openfire_users
    # GET /openfire_users.json
    def index
        @openfire_users = OpenfireUser.where("mi_user_id = ?", current_mi_user.id)
        @login_email=current_mi_user.email
    end

    # GET /openfire_users/1
    # GET /openfire_users/1.json
    def show
    end

    # GET /openfire_users/new
    def new
        @openfire_user = OpenfireUser.new
        @login_email=current_mi_user.email
    end

    # GET /openfire_users/1/edit
    def edit
    end

    # POST /openfire_users
    # POST /openfire_users.json
    def create
        require 'securerandom'
        password=SecureRandom.hex(8)[0,6]
        @mi_user=MiUser.find(current_mi_user.id)
        @openfire_user = @mi_user.openfire_users.new(openfire_user_params)
        if @openfire_user.groups
            @openfire_user.groups=@mi_user.companyName+"_"+@openfire_user.groups
        else
            @openfire_user.groups=@mi_user.companyName
        end
        @openfire_user.password=password
        respond_to do |format|
            if @openfire_user.save
                session[:password] =password
                MinstantEmail.registration_confirmation(@openfire_user).deliver
                format.html { redirect_to @openfire_user, notice: 'Le compte openfire a été crée avec success. Un mail contenant les infos de connexion a éte envoyé à l\'adresse mail indiquée' }
            else
                format.html { render action: 'new' }
            end
        end
    end

    # PATCH/PUT /openfire_users/1
    # PATCH/PUT /openfire_users/1.json
    def update
        respond_to do |format|
            if @openfire_user.update(openfire_user_params)
                format.html { redirect_to @openfire_user, notice:'Le compte openfire a été mis à jour avec success. Un mail contenant les nouvelles données a éte envoyé à l\'adresse mail indiquée' }
            else
                format.html { render action: 'edit' }
            end
        end
    end

    # DELETE /openfire_users/1
    # DELETE /openfire_users/1.json
    def destroy
        @openfire_user.destroy
        respond_to do |format|
            format.html { redirect_to openfire_users_url(:tache=>"rem") }
        end
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_openfire_user
          @openfire_user = OpenfireUser.find(params[:id])
          @login_email=current_mi_user.email
      end

      # Never trust parameters from the scary internet, only allow the white list through.
      def openfire_user_params
          params.require(:openfire_user).permit(:name, :username, :groups, :mi_user_id, :email)
      end
end
