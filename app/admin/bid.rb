ActiveAdmin.register Bid do
  includes :user, :product

  menu priority: 3
  actions :index, :show

  filter :product
  filter :user, as: :select, collection: -> { User.all.map {|u| [u.email, u.id] } }

  index do
    selectable_column
    column 'Bid Nº' do |bid|
      link_to bid.id, admin_bid_path(bid)
    end
    column 'Producto', :product, sortable: 'products.name'
    column 'Usuario', :user, sortable: 'users.email'
    column 'Precio actual' do |bid|
      number_to_currency bid.product.price
    end
  end

end
