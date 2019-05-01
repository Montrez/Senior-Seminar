class ManagersController < ApplicationController
    before_action :set_manager, only: [:edit, :update]
  
    def pundit_user
      current_account
    end
    # GET /managers/1/edit
    def edit
    end
  
    # PATCH/PUT /managers/1
    # PATCH/PUT /managers/1.json
    def update
      respond_to do |format|
        if @manager.update(manager_params)
          format.html { redirect_to home_index_url, notice: "The profile of the manager #{@manager.name} was successfully updated." }
          format.json { head :no_content }
        else
          format.html { render action: 'edit' }
          format.json { render json: @manager.errors, status: :unprocessable_entity }
        end
      end
    end
  
    private
      # Use callbacks to share common setup or constraints between actions.
      def set_manager
        @manager = Manager.find(params[:id])
      end
  
      # Never trust parameters from the scary internet, only allow the white list through.
      def manager_params
        params.require(:manager).permit(:name, :address)
      end
  end