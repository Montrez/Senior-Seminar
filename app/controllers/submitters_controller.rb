class SubmittersController < ApplicationController
    before_action :set_submitter, only: [:edit, :update]
  
    # GET /submitters/1/edit
  def pundit_user
     current_account
  end
    def edit
    end
  
    # PATCH/PUT /submitters/1
    # PATCH/PUT /submitters/1.json
    def update
      respond_to do |format|
        if @submitter.update(submitter_params)
          format.html { redirect_to home_index_url, notice: "The profile of the submitter #{@submitter.name} was successfully updated." }
          format.json { head :no_content }
        else
          format.html { render action: 'edit' }
          format.json { render json: @submitter.errors, status: :unprocessable_entity }
        end
      end
    end
  
    private
      # Use callbacks to share common setup or constraints between actions.
      def set_submitter
        @submitter = Submitter.find(params[:id])
      end
  
      # Never trust parameters from the scary internet, only allow the white list through.
      def submitter_params
        params.require(:submitter).permit(:name, :address)
      end
  end
