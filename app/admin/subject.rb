ActiveAdmin.register Subject do
  permit_params :name, book_ids: []

  form do |f|
    f.inputs 'Subject Details' do
      f.input :name
      f.input :books, as: :check_boxes
    end
    f.actions
  end
end
