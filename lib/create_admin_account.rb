AdminAccount.transaction do
  AdminAccount.delete_all
  AdminAccount.create( :name => 'admin' )
end

Account.transaction do
  Account.create( :email => 'admin@jmj.rails', :password => 'password', :password_confirmation => 'password', 
                  :accountable => AdminAccount.first())
end