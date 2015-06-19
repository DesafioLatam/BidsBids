ActiveAdmin.register Product do

  permit_params :name, :description, :price, :imagen, :premium

  menu priority: 2, label: 'Productos'

  scope :all, default: true
  scope :premium

  index as: :grid, columns: 5 do |product|
    div do
      a href: admin_product_path(product) do
        image_tag product.imagen
      end
    end
    span do
      link_to truncate(product.name), admin_product_path(product),
        style: 'display:block; text-align: center;'
    end
  end

  show do
    tabs do
      tab 'Detalles' do
        attributes_table do
          row :name
          row :description
          row :image do |p|
            image_tag p.imagen
          end
          row :price do |p|
            number_to_currency p.price
          end
        end
      end

      tab 'Comentarios' do
        active_admin_comments
      end
    end
  end


  form do |f|
    f.inputs 'Detalles' do
      f.input :name
      f.input :description
      f.input :price
    end

    f.inputs 'Otros' do
      f.input :imagen
      f.input :premium
    end

    f.actions
  end

  filter :bids, as: :select, collection: Bid.all.map {|b| [b.user.email, b.id]}
  filter :price
  filter :premium

  sidebar 'Info relacionada' do
    render('/admin/sidebar_info')
  end


end
