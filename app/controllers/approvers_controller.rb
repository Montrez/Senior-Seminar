class ApproversController < ApplicationController
    before_action :set_approver, only: [:edit, :update]
  
    # GET /approvers/1/edit
    def pundit_user
      current_user
    end

    def edit
    end
  
    # PATCH/PUT /approvers/1
    # PATCH/PUT /approvers/1.json
    def update
      respond_to do |format|
        if @approver.update(approver_params)
          format.html { redirect_to home_index_url, notice: "The profile of the approver #{@approver.name} was successfully updated." }
          format.json { head :no_content }
        else
          format.html { render action: 'edit' }
          format.json { render json: @approver.errors, status: :unprocessable_entity }
        end
      end
    end
  
    private
      # Use callbacks to share common setup or constraints between actions.
      def set_approver
        @approver = Approver.find(params[:id])
      end
  
      # Never trust parameters from the scary internet, only allow the white list through.
      def approver_params
        params.require(:approver).permit(:name, :address, :department)
      end
  end
