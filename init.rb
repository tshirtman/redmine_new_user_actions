require 'user_hooks'

Redmine::Plugin.register :redmine_new_user_actions do
  name 'Redmine New User Actions'
  author 'gabriel.pettier@alterway.fr'
  description 'Bind actions to new users creation'
  version '0.0.1'
  url ''
  author_url 'alterway.fr'

  settings(:default => {
    'add_to_projects' => ""
  },
    :partial => 'settings/new_user_actions')
end
