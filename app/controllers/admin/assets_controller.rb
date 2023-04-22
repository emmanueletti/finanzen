module Admin
  class AssetsController < AdminController
    before_action :set_asset, only: %i[show edit update destroy]

    # GET /assets or /assets.json
    def index
      @assets = Asset.all
    end

    # GET /assets/1 or /assets/1.json
    def show
    end

    # GET /assets/new
    def new
      @asset = Asset.new
    end

    # GET /assets/1/edit
    def edit
    end

    # POST /assets or /assets.json
    def create
      @asset = Asset.new(asset_params.slice(:name, :owner, :category))

      asset_value = AssetValue.new(amount: asset_params["value"], date: Time.now)
      @asset.asset_values << asset_value

      respond_to do |format|
        if @asset.save
          format.html { redirect_to admin_wealth_index_path, notice: "Asset was successfully created." }
          format.json { render :show, status: :created, location: @asset }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @asset.errors, status: :unprocessable_entity }
        end
      end
    end

    # PATCH/PUT /assets/1 or /assets/1.json
    def update
      respond_to do |format|
        @asset.assign_attributes(asset_params.slice(:name, :owner, :category))
        latest_asset_value = @asset.asset_values.last.amount

        if latest_asset_value != asset_params["value"].to_i
          new_asset_value = AssetValue.new(amount: asset_params["value"], date: Time.now)
          @asset.asset_values << new_asset_value
        end

        if @asset.save
          format.html { redirect_to admin_wealth_index_path, notice: "Asset was successfully updated." }
          format.json { render :show, status: :ok, location: @asset }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @asset.errors, status: :unprocessable_entity }
        end
      end
    end

    # DELETE /assets/1 or /assets/1.json
    def destroy
      @asset.destroy

      respond_to do |format|
        format.html { redirect_to admin_assets_url, notice: "Asset was successfully destroyed." }
        format.json { head :no_content }
      end
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_asset
      @asset = Asset.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def asset_params
      params.require(:admin_asset).permit(:name, :owner, :category, :value)
    end
  end
end
