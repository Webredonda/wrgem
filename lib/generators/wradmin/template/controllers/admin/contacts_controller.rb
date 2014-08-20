class Admin::ContactsController < ApplicationController

  before_action :authenticate_user!
  layout "admin"

  before_action :set_admin_contact, only: [:show, :edit, :update, :destroy]

  def index
    @admin_contacts = Admin::Contact.all
  end

  def show
    #redirect_to edit_admin_contact_url(params[:id])
    @admin_contact.update(read: false)
    @contact = Admin::Contact.find(params[:id])
  end

  def new
    @admin_contact = Admin::Contact.new
  end

  def edit
    @admin_contacts = Admin::Contact.all.order("updated_at desc").limit(5)
  end

  def create
    @admin_contact = Admin::Contact.new(admin_contact_params)

    if @admin_contact.save
      redirect_to admin_contacts_path, notice: 'Criado com sucesso.'
    else
      render action: 'new'
    end
  end

  def update
    if @admin_contact.update(admin_contact_params)
      redirect_to admin_contacts_path, notice: 'Alterado com sucesso.'
    else
      render action: 'edit'
    end
  end

  def destroy
    @admin_contact.destroy
    redirect_to admin_contacts_url, notice: 'Excluído com sucesso.'
  end

  private
    def set_admin_contact
      @admin_contact = Admin::Contact.find(params[:id])
    end

    def admin_contact_params
      params.require(:admin_contact).permit(:name, :email, :subject, :message, :read)
    end
end
