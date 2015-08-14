class AddSiteIdToRequests < ActiveRecord::Migration
  def change
    add_reference :requests, :site, index: true, foreign_key: true
  end
end
