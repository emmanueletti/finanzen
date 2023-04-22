module Admin
  class DebtsController < AdminController
    before_action :set_debt, only: %i[show edit update destroy]

    # GET /debts or /debts.json
    def index
      @debts = Debt.all
    end

    # GET /debts/1 or /debts/1.json
    def show
    end

    # GET /debts/new
    def new
      @debt = Debt.new
    end

    # GET /debts/1/edit
    def edit
    end

    # POST /debts or /debts.json
    def create
      @debt = Debt.new(debt_params.slice(:name, :owner, :category))

      debt_value = DebtValue.new(amount: ensure_negative_value, date: Time.now)
      @debt.debt_values << debt_value

      respond_to do |format|
        if @debt.save
          format.html { redirect_to admin_wealth_index_path, notice: "Debt was successfully created." }
          format.json { render :show, status: :created, location: @debt }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @debt.errors, status: :unprocessable_entity }
        end
      end
    end

    # PATCH/PUT /debts/1 or /debts/1.json
    def update
      respond_to do |format|
        @debt.assign_attributes(debt_params.slice(:name, :owner, :category))
        latest_debt_value = @debt.debt_values.last.amount

        if latest_debt_value != debt_params["value"].to_i
          new_debt_value = DebtValue.new(amount: ensure_negative_value, date: Time.now)
          @debt.debt_values << new_debt_value
        end

        if @debt.save
          format.html { redirect_to admin_wealth_index_path, notice: "Debt was successfully updated." }
          format.json { render :show, status: :ok, location: @debt }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @debt.errors, status: :unprocessable_entity }
        end
      end
    end

    # DELETE /debts/1 or /debts/1.json
    def destroy
      @debt.destroy

      respond_to do |format|
        format.html { redirect_to admin_debts_url, notice: "Debt was successfully destroyed." }
        format.json { head :no_content }
      end
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_debt
      @debt = Debt.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def debt_params
      params.require(:admin_debt).permit(:name, :owner, :category, :value)
    end

    def ensure_negative_value
      amount = debt_params["value"].to_i

      if amount > 0
        return amount * -1
      end
      amount
    end
  end
end
