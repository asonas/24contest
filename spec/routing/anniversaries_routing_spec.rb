require "spec_helper"

describe AnniversariesController do
  describe "routing" do

    it "routes to #index" do
      get("/anniversaries").should route_to("anniversaries#index")
    end

    it "routes to #new" do
      get("/anniversaries/new").should route_to("anniversaries#new")
    end

    it "routes to #show" do
      get("/anniversaries/1").should route_to("anniversaries#show", :id => "1")
    end

    it "routes to #edit" do
      get("/anniversaries/1/edit").should route_to("anniversaries#edit", :id => "1")
    end

    it "routes to #create" do
      post("/anniversaries").should route_to("anniversaries#create")
    end

    it "routes to #update" do
      put("/anniversaries/1").should route_to("anniversaries#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/anniversaries/1").should route_to("anniversaries#destroy", :id => "1")
    end

  end
end
