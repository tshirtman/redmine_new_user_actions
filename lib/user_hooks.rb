module NewUserActionsPlugin
  class Hooks < Redmine::Hook::ViewListener

    def controller_users_success_creation(context={})
      if Setting.plugin_redmine_new_user_actions['add_to_projects']
        Setting.plugin_redmine_new_user_actions['add_to_projects'].split("\n").each do |line|
          project, role = line.split(':')
          project = Project.find_by_name(project.strip)
          role = Role.find_by_name role.strip

          member = Member.new
          member.user = context[:user]
          member.project = project
          member.roles += [role]
          member.save
        end
      end
    end
  end
end
