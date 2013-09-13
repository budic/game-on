require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe EventInvitesController do

  # This should return the minimal set of attributes required to create a valid
  # EventInvite. As you add validations to EventInvite, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { { "status" => "1" } }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # EventInvitesController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all event_invites as @event_invites" do
      event_invite = EventInvite.create! valid_attributes
      get :index, {}, valid_session
      assigns(:event_invites).should eq([event_invite])
    end
  end

  describe "GET show" do
    it "assigns the requested event_invite as @event_invite" do
      event_invite = EventInvite.create! valid_attributes
      get :show, {:id => event_invite.to_param}, valid_session
      assigns(:event_invite).should eq(event_invite)
    end
  end

  describe "GET new" do
    it "assigns a new event_invite as @event_invite" do
      get :new, {}, valid_session
      assigns(:event_invite).should be_a_new(EventInvite)
    end
  end

  describe "GET edit" do
    it "assigns the requested event_invite as @event_invite" do
      event_invite = EventInvite.create! valid_attributes
      get :edit, {:id => event_invite.to_param}, valid_session
      assigns(:event_invite).should eq(event_invite)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new EventInvite" do
        expect {
          post :create, {:event_invite => valid_attributes}, valid_session
        }.to change(EventInvite, :count).by(1)
      end

      it "assigns a newly created event_invite as @event_invite" do
        post :create, {:event_invite => valid_attributes}, valid_session
        assigns(:event_invite).should be_a(EventInvite)
        assigns(:event_invite).should be_persisted
      end

      it "redirects to the created event_invite" do
        post :create, {:event_invite => valid_attributes}, valid_session
        response.should redirect_to(EventInvite.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved event_invite as @event_invite" do
        # Trigger the behavior that occurs when invalid params are submitted
        EventInvite.any_instance.stub(:save).and_return(false)
        post :create, {:event_invite => { "status" => "invalid value" }}, valid_session
        assigns(:event_invite).should be_a_new(EventInvite)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        EventInvite.any_instance.stub(:save).and_return(false)
        post :create, {:event_invite => { "status" => "invalid value" }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested event_invite" do
        event_invite = EventInvite.create! valid_attributes
        # Assuming there are no other event_invites in the database, this
        # specifies that the EventInvite created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        EventInvite.any_instance.should_receive(:update).with({ "status" => "1" })
        put :update, {:id => event_invite.to_param, :event_invite => { "status" => "1" }}, valid_session
      end

      it "assigns the requested event_invite as @event_invite" do
        event_invite = EventInvite.create! valid_attributes
        put :update, {:id => event_invite.to_param, :event_invite => valid_attributes}, valid_session
        assigns(:event_invite).should eq(event_invite)
      end

      it "redirects to the event_invite" do
        event_invite = EventInvite.create! valid_attributes
        put :update, {:id => event_invite.to_param, :event_invite => valid_attributes}, valid_session
        response.should redirect_to(event_invite)
      end
    end

    describe "with invalid params" do
      it "assigns the event_invite as @event_invite" do
        event_invite = EventInvite.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        EventInvite.any_instance.stub(:save).and_return(false)
        put :update, {:id => event_invite.to_param, :event_invite => { "status" => "invalid value" }}, valid_session
        assigns(:event_invite).should eq(event_invite)
      end

      it "re-renders the 'edit' template" do
        event_invite = EventInvite.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        EventInvite.any_instance.stub(:save).and_return(false)
        put :update, {:id => event_invite.to_param, :event_invite => { "status" => "invalid value" }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested event_invite" do
      event_invite = EventInvite.create! valid_attributes
      expect {
        delete :destroy, {:id => event_invite.to_param}, valid_session
      }.to change(EventInvite, :count).by(-1)
    end

    it "redirects to the event_invites list" do
      event_invite = EventInvite.create! valid_attributes
      delete :destroy, {:id => event_invite.to_param}, valid_session
      response.should redirect_to(event_invites_url)
    end
  end

end
