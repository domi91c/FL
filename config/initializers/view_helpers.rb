require "quill/rails5/version"

module Quill
  module Rails5
    module ViewHelpers
      def quill(options = {}, html_options = {}, &block)
        default_options = {
            theme: 'snow',
        }
        actual_options = default_options.merge(options)

        default_html_options = {
            id: 'editor',
        }
        actual_html_options = default_html_options.merge(html_options)

        stylesheet_link_tag("//cdn.quilljs.com/#{VERSION}/quill.#{actual_options[:theme]}.css") +
            content_tag(:div, capture(&block), actual_html_options, escape: false) +
            javascript_include_tag("//cdn.quilljs.com/#{VERSION}/quill.min.js") +
            javascript_tag("  var quill = new Quill('##{actual_html_options[:id]}', {
          modules: {
            'toolbar': [
              [ 'bold', 'italic', 'underline', 'strike' ],
            ],
          },
          theme: '#{actual_options[:theme]}'
        });")
      end

      def quill_field(form, name, editor_id = 'editor')
        field_id = [form.object_name, name].join('_')
        form.hidden_field(name) +
            javascript_tag("  $(document).on('turbolinks:load', function() {
          $('form##{form.options[:html][:id]}').submit(function() {
            $('##{field_id}').val($('##{editor_id} .ql-editor').html());
          });
        });")
      end
    end
  end
end
