# app/admin/books.rb
ActiveAdmin.register Book do
  permit_params :title, :description, :downloads, :license, :image, agent_ids: [], subject_ids: []

  form do |f|
    f.inputs 'Book Details' do
      f.input :title
      f.input :description
      f.input :downloads
      f.input :license
      f.input :agents, as: :check_boxes
      f.input :subjects, as: :check_boxes
      f.input :image, as: :file
    end
    f.actions
  end

  show do
    attributes_table do
      row :title
      row :description
      row :downloads
      row :license
      row :agents do |book|
        book.agents.map(&:name).join(', ')
      end
      row :subjects do |book|
        book.subjects.map(&:name).join(', ')
      end
      row :image do |book|
        if book.image.attached?
          image_tag url_for(book.image)
        else
          content_tag(:span, "No image")
        end
      end
    end
  end

  index do
    selectable_column
    id_column
    column :title
    column :description
    column :downloads
    column :license
    column :agents do |book|
      book.agents.map(&:name).join(', ')
    end
    column :subjects do |book|
      book.subjects.map(&:name).join(', ')
    end
    column :image do |book|
      if book.image.attached?
        image_tag url_for(book.image), size: "50x50"
      else
        content_tag(:span, "No image")
      end
    end
    actions
  end

  filter :title
  filter :description
  filter :downloads
  filter :license
  filter :agents
  filter :subjects
  filter :created_at
  filter :updated_at
end
