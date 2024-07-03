ActiveAdmin.register Book do
  permit_params :title, :description, :downloads, :license, agent_ids: [], subject_ids: []

  form do |f|
    f.inputs 'Book Details' do
      f.input :title
      f.input :description
      f.input :downloads
      f.input :license
      f.input :agents, as: :check_boxes
      f.input :subjects, as: :check_boxes
    end
    f.actions
  end
end
