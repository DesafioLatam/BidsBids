ActiveAdmin.register Product do

  permit_params :name, :description, :price, :imagen, :premium

  menu priority: 2, label: 'Productos'

  scope :all, default: true
  scope :premium

  index as: :grid do |product|
    div do
      a href: admin_product_path(product) do
        image_tag product.imagen
      end
       a truncate product.name, href: admin_product_path(product)
    end
  end

  show do
    panel 'Producto' do
      table_for product do |t|
        tr do
          td 'Nombre:'
          td product.name
        end
        tr do
          td 'Descripcion:'
          td product.description
        end
        tr do
          td 'Imagen:'
          td do
            image_tag product.imagen
          end
        end
        tr do
          td 'Precio:'
          td number_to_currency product.price
        end
        tr do
          td 'Premium:'
          td product.premium
        end
      end
    end
  end


  form do |f|
    inputs 'Detalles' do
      input :name
      input :description
      input :price
    end

    inputs 'Otros' do
      input :imagen
      input :premium
    end

    actions
  end

  filter :bids, as: :select, collection: proc { Bid.all.map {|b| [b.user.email, b.id]} }
  filter :price
  filter :premium

  sidebar 'Info relacionada' do
    render('/admin/sidebar_info')
  end


end
