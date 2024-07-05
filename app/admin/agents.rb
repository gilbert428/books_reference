ActiveAdmin.register Agent do
  permit_params :name, book_ids: []

  form do |f|
    f.inputs 'Agent Details' do
      f.input :name
      f.input :books, as: :check_boxes, collection: Book.all
    end
    f.actions
  end

  # Add filters for searching and filtering agents
  filter :name
  filter :books_id_eq, as: :select, collection: -> { Book.all.pluck(:title, :id) }
end
