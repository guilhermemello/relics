module ApplicationHelper
  def display_base_errors resource
    return '' if (resource.errors.empty?) or (resource.errors[:base].empty?)
    messages = resource.errors[:base].map { |msg| content_tag(:p, msg) }.join
    html = <<-HTML
    <div class="alert alert-error alert-block">
      <button type="button" class="close" data-dismiss="alert">&#215;</button>
      #{messages}
    </div>
    HTML
    
    html.html_safe
  end

  def display_errors_from(resource)
    return '' if resource.nil? or resource.errors.empty?

    html = "<div class=\"mws-form-message error\">Ocorreu um erro<ul>"

    resource.errors.each do |attr, msg|
      html << "<li>#{msg}</li>" if resource.errors[attr].first == msg
    end

    html << "</ul></div>"

    html.html_safe
  end

  def page_entries_info(collection, options = {})
    entry_name = options[:entry_name] || (collection.empty?? 'item' : collection.first.class.name.split('::').last.titleize)
    container_inicio = "<div class=\"dataTables_info\">"
    container_fim = "</div>"
    str = ""

    if collection.total_pages < 2
      case collection.size
        when 0; str = "Nenhum registro foi encontrado"
      end
    else
      str = %{Exibindo %d - %d de %d #{entry_name.pluralize}} % [
        collection.offset + 1,
        collection.offset + collection.length,
        collection.total_entries
      ]
    end

    (container_inicio + str + container_fim).html_safe
  end

  def exibir_visibilidades(evento)
    "#{evento.visibilidades.collect { |v| v.nome }.join(" e ")}"
  end
end
