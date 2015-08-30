Render.live = false
Render::Definition.load_from_directory!(Rails.root.join(*%w(spec schemas)))
