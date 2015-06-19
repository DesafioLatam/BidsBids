ActiveAdmin.register Bid do

  controller do
    def scoped_collection
      Bid.includes(:user, :product)
    end
  end

  menu priority: 3
  actions :index, :show

  filter :product
  filter :user, as: :select, collection: proc { User.all.map { |u| [u.email, u.id] } }

  index do
    column("Orden", sortable: :id) {|bid| link_to "#{bid.id}", admin_bid_path(bid)}
    column('Producto') {|bid| bid.product.name}
    column('Usuario', :user, sortable: :user_id)
    column('Precio actual') {|bid| number_to_currency bid.product.price}
  end

end
