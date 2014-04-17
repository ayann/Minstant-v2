class OpenfireUser < ActiveRecord::Base
  belongs_to :mi_user
  attr_accessor :password
  validates_uniqueness_of :username,:on => :create
  validates_presence_of :name,:username,:email
  after_create :save_on_openfire
  after_destroy :delete_on_openfire
  after_update :update_on_openfire
  def save_on_openfire
    api.add_user!(:username => self.username, :password => self.password, :name => self.name, :email =>self.email, :groups =>self.groups)
  end
  def update_on_openfire
    api.update_user!(:username => self.username, :name => self.name, :email =>self.email, :groups =>self.groups)
  end
  def delete_on_openfire
    api.delete_user!(:username =>self.username)
  end
  def api
    api = OpenfireApiRuby::UserService.new(:url => "http://localhost:9090/", :secret => "980MGw4s")
  end
end
