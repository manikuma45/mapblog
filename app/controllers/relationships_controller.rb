class RelationshipsController < ApplicationController
  before_action :authenticate_user!
  respond_to? :js
  def create
    relationship = current_user
                  .active_relationships
                  .build(followed_id: params[:relationship][:followed_id])
    relationship.save
    @user = User.find(relationship.followed_id)
  end

  def destroy
    relationship = Relationship.find(params[:id])
    relationship.destroy
    @user = relationship.followed
  end
end