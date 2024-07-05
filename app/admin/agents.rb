ActiveAdmin.register Agent do
  permit_params :name, book_ids: []

  form do |f|
    f.inputs 'Agent Details' do
      f.input :name
      f.input :books, as: :check_boxes, collection: Book.all
    end
    f.actions
  end

  show do
    attributes_table do
      row :name
      row :books do |agent|
        agent.books.map(&:title).join(', ')
      end
    end
  end

  index do
    selectable_column
    id_column
    column :name
    column :books do |agent|
      agent.books.map(&:title).join(', ')
    end
    actions
  end

  filter :name
  filter :books_title_cont, as: :string, label: 'Book Title'
  filter :created_at
  filter :updated_at
end
