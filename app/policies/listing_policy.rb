class ListingPolicy < ApplicationPolicy

  def initialize(user, listing)
    @user = user
    @listing = listing
  end

  def index?
    true
  end

  def show?
    true
  end

  def new?
    false
  end

  def edit?
    true if @user && @listing.seller_id == @user.id
  end
end