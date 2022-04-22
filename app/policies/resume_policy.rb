# frozen_string_literal: true

class ResumePolicy < ApplicationPolicy
  def index?
    internal_user || vendor
  end

  def new?
    interviewee
  end

  def create?
    interviewee
  end

  def update?
    edit?
  end

  def edit?
    interviewee || internal_user
  end

  def destroy
    interviewee
  end

  class Scope < Scope
  end
end
