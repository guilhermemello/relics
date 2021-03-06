# Be sure to restart your server when you modify this file.

# Add new inflection rules using the following format
# (all these examples are active by default):
 ActiveSupport::Inflector.inflections do |inflect|
   #inflect.plural /^(ox)$/i, '\1en'
   #inflect.singular /^(ox)en/i, '\1'
   #inflect.irregular 'person', 'people'
   #inflect.uncountable %w( fish sheep )
   inflect.irregular 'oriente_estadual', 'orientes_estaduais'
   inflect.irregular 'obediencia', 'obediencias'
   inflect.irregular 'situacao', 'situacoes'
   inflect.irregular 'irmao', 'irmaos'
   inflect.irregular 'filiacao', 'filiacoes'
   inflect.irregular 'fundador', 'fundadores'
   inflect.irregular 'eleicao', 'eleicoes'
 end
#
# These inflection rules are supported but not enabled by default:
# ActiveSupport::Inflector.inflections do |inflect|
#   inflect.acronym 'RESTful'
# end
