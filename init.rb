require 'redmine'
require 'dispatcher'
require_dependency 'issue_summary_listener'
require_dependency 'user'
require 'user_patch'

Redmine::Plugin.register :redmine_ezsummary do
  name 'Redmine ezSummary plugin'
  author 'Peng Zuo'
  description 'Send Summary Emails'
  version '0.0.1'
  url 'http://ezwork.techcon.thtf.com.cn'

  project_module :ez_summary do
    permission :ezsummary_send_mail, :ez_issue_summaries =>  [:new, :create]
  end
end

Dispatcher.to_prepare do
  User.send(:include, PengZuo::UserPatch)
end
