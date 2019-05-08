require 'prawn'
require 'prawn/table'

module Relational
  module Writer
    class Pdf
      def call(relation, opts = {})
        title = opts[:title] || relation.meta[:title]
        subtitle = opts[:subtitle] || relation.meta[:subtitle]

        pdf = Prawn::Document.new(opts)
        pdf.text title, size: 16, style: :bold if title
        pdf.text subtitle, size: 10 if title
        pdf.text "\n" if title or subtitle

        data = relation.body.map(&:to_a)
        data_table = [relation.headers] + data

        pdf.table(data_table) do
          row(0).font_style = :bold
        end
        pdf.render
      end
    end
  end
end