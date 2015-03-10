#!/bin/env ruby
# encoding: utf-8

require 'redmine'
require 'mailer'

Redmine::Plugin.register :chiliproject_notification_header do
  name 'Notification Header'
  author 'Alexander Blum'
  description 'This plugin for ChiliProject changes the header of outgoing mails'
  version '0.1'
  author_url 'mailto:alexander.blum@c3s.cc'
  url 'https://github.com/C3S/chiliproject_notification_header'
end

# Patch User
Dispatcher.to_prepare do
  require_dependency 'mailer'
  Mailer.send(:include, MailHeader)
end