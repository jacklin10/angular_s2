require 'spec_helper'

describe User do

  describe "with_single_company" do

    it "should clear any existing companies from the user" do
      user = FactoryGirl.build_stubbed(:user)
      user.expects(:companies=).with([])

      user.with_single_company
    end

    it "should build a company for the user" do
      user = FactoryGirl.build_stubbed(:user)
      user.stubs(:companies=).returns([])

      companies = [mock("fake company")]
      user.expects(:companies).returns(companies)
      companies.expects(:build)
      user.with_single_company
    end

  end

end
