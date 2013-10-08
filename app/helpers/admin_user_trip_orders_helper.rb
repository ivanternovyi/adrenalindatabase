module AdminUserTripOrdersHelper
  def link_to_add_payment(name, f)
    new_object = f.object.send(:user_payment_trip_orders).klass.new
    id = new_object.object_id
    fields = f.fields_for(:user_payment_trip_orders, new_object, child_index: id) do |builder|
      render('payment_fields', f: builder)
    end
    link_to(name, '#', class: 'add_payment_fields', data: {id: id, fields: fields.gsub("\n", "")})
  end
end
