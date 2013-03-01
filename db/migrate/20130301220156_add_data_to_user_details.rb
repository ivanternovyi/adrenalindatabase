class AddDataToUserDetails < ActiveRecord::Migration
  def change
    usr_det = UserDetail.create(surname: 'Admin', name: 'Admin', mid_name: 'Admin', birthday: '2000-10-12', post_address: 'Address')
    User.find_by_email('adm@adm.adm').update_attributes(user_detail: usr_det)
  end
end
