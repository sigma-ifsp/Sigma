require 'test_helper'

class PointObserverTest < ActiveSupport::TestCase
  setup do
    @promotion = promotions(:one)
    @company = companies(:one)
    @point = Point.new(value: 50, company_id: @company.id, promotion_id: @promotion.id)
    @observer = PointObserver.instance
  end

  test '#after_save update balance' do
    ClientBalance.expects(:find_or_create_by_client_id_and_promotion_id).
      with(@point.client_id, @point.promotion_id).returns(ClientBalance.new)
    @point.stubs(:points).returns(10)
    @observer.after_save(@point)
  end
end
