require 'devise/test_helpers'
require 'cancan/matchers'

class DummyAbility
  include CanCan::Ability

  def initialize(*_args)
    alias_action :read, :create, :update, :destroy, :close, :open, to: :basic_manage
  end
end

module AuthSupport
  extend ActiveSupport::Concern
  include Devise::Test::ControllerHelpers

  included do
    before(:each) do
      allow(dummy_user).to receive(:has_any_role?).and_return(true)
      allow(dummy_user).to receive(:has_role?).and_return(true)
    end

    before do
      @request.env['devise.mapping'] = Devise.mappings[:user]

      sign_in dummy_user

      allow(warden).to receive(:authenticate!).and_return(dummy_user)
      allow(controller).to receive(:current_user).and_return(dummy_user)
      allow(controller).to receive(:current_ability).and_return(dummy_ability)
    end

    delegate :current_ability, :current_user, to: :controller

    before { ::PaperTrail.whodunnit = current_user.id }
  end

  def abstract_ability
    @abstract_ability ||= DummyAbility.new
  end

  def dummy_ability
    ability = abstract_ability.dup
    ability.can(:basic_manage, :all)
    ability
  end

  def dummy_user
    @dummy_user ||= FactoryGirl.create(:user)
  end
end

RSpec.configure do |config|
  config.include AuthSupport, type: :controller
end
