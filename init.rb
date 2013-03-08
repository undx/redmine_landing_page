require 'redmine'

Redmine::Plugin.register :redmine_landing_page do
  name 'Redmine Landing Page plugin'
  author 'Igor Zubkov / undx'
  description 'Redmine Landing Page plugin'
  version '0.0.3'
  url 'https://github.com/undx/redmine_landing_page'
  author_url 'https://github.com/undx'
end

Rails.configuration.to_prepare do
  require_dependency 'projects_controller'
  ProjectsController.send(:include, RedmineLandingPage::Patches::ProjectsControllerPatch)

  require_dependency 'project'
  Project.send(:include, RedmineLandingPage::Patches::ProjectPatch)

  require_dependency 'principal'
  User.send(:include, RedmineLandingPage::Patches::UserPatch)

  require_dependency 'welcome_controller'
  WelcomeController.send(:include, RedmineLandingPage::Patches::WelcomeControllerPatch)
end

require 'redmine_landing_page/hooks/view_projects_form_hook'
require 'redmine_landing_page/hooks/view_my_account_hook'
require 'redmine_landing_page/hooks/view_users_form_hook'
