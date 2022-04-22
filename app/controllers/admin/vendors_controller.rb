# frozen_string_literal: true

module Admin
  class VendorsController < Admin::BaseController
    def index
      @vendors = User.where(role: 'vendor')
    end

    def new
      @vendor = User.new
    end

    def create
      # render html: params
      @vendor = User.new(vendor_params)
      # @vendor.role = "vendor"

      if @vendor.save
        redirect_to admin_vendors_path
      else
        render :new
      end
    end

    private

    # def user_params
    #     params.require(:user).permit(:username, :email, :password, :password_confirmation)
    # end
    def vendor_params
      params.require(:user).permit(:username, :email, :password, :password_confirmation).merge(role: 'vendor')
    end
  end
end
