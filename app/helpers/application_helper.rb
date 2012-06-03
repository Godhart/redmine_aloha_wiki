# encoding: utf-8
#
# Redmine - project management software
# Copyright (C) 2006-2011  Jean-Philippe Lang
#
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License
# as published by the Free Software Foundation; either version 2
# of the License, or (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.

require 'forwardable'
require 'cgi'

module ApplicationHelper

  # Formats text according to system settings.
  # 2 ways to call this method:
  # * with a String: textilizable(text, options)
  # * with an object and one of its attribute: textilizable(issue, :description, options)
  def textilizable_wysiwyg(*args)
    options = args.last.is_a?(Hash) ? args.pop : {}
    case args.size
    when 1
      obj = options[:object]
      text = args.shift
    when 2
      obj = args.shift
      attr = args.shift
      text = obj.send(attr).to_s
    else
      raise ArgumentError, 'invalid arguments to textilizable'
    end
    return '' if text.blank?
    project = options[:project] || @project || (obj && obj.respond_to?(:project) ? obj.project : nil)
    only_path = options.delete(:only_path) == false ? false : true

    text = Redmine::WikiFormatting.to_html(Setting.text_formatting, text, :object => obj, :attribute => attr)

    @parsed_headings = []
    @heading_anchors = {}
    @current_section = 0 if options[:edit_section_links]

    parse_sections(text, project, obj, attr, only_path, options)
    text = parse_non_pre_blocks(text) do |text|
      [:parse_inline_attachments, :parse_wiki_links, :parse_redmine_links].each do |method_name|
        send method_name, text, project, obj, attr, only_path, options
      end
    end

    text.html_safe
  end

end
