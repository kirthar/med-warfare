MAX_LEVEL = 10

SIZE_SETS = HashWithIndifferentAccess.new(YAML.load_file("#{Rails.root}/config/initializers/levels_experience.yml"))
