#!/bin/env ruby
# encoding: utf-8

module MailHeader

  def self.included(base) # :nodoc:

    base.send(:include, InstanceMethods)

    base.class_eval do
      alias_method_chain :issue_edit, :new_header
    end

  end

  module InstanceMethods

    def issue_edit_with_new_header(journal, recipient)
      issue = journal.journaled.reload
      redmine_headers 'Updated-By' => journal.user.login
      redmine_headers 'Status' => issue.status.name
      redmine_headers 'Priority' => issue.priority.name
      issue_edit_without_new_header(journal, recipient)
    end

  end

end