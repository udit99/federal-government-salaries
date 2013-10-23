require 'spec_helper'

describe SalariesController do
  describe "#index" do
    let(:grouped_salaries) {[{
      salary_segment: 5,
      count: 2
    }]}
    it "should render the salaries grouped by segment as json" do
      Salary.stub(:group_by_segment).and_return(grouped_salaries)

      get :index
      response.body.should == grouped_salaries.to_json
    end
  end
end
