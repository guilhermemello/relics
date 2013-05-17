# coding: utf-8

puts "\n"

puts "CRIANDO ROLES"
role_usuario = Role.find_or_create_by_name({ :name => "usuario" }, :without_protection => true)
role_admin_loja = Role.find_or_create_by_name({ :name => "admin_loja" }, :without_protection => true)
role_admin_ambiente = Role.find_or_create_by_name({ :name => "admin_ambiente" }, :without_protection => true)
role_admin_master = Role.find_or_create_by_name({ :name => "admin_master" }, :without_protection => true)

puts "CRIANDO OBEDIÊNCIAS"
obediencia = Obediencia.find_or_create_by_nome(:nome => "Grande Oriente do Brasil", :sigla => "GOB", :email => "www.gob.org.br")

puts "CRIANDO ESTADOS"
estado_rj = Estado.find_or_create_by_nome(:nome => "Rio de Janeiro", :uf => "RJ")
estado_df = Estado.find_or_create_by_nome(:nome => "Distrito Fderal", :uf => "DF")

puts "CRIANDO CIDADES"
cidade_dc = Cidade.find_or_create_by_nome(:nome => "Duque de Caxias", :uf => "RJ", :estado => estado_rj)
cidade_bs = Cidade.find_or_create_by_nome(:nome => "Brasília", :uf => "DF", :estado => estado_df)

puts "CRIANDO BAIRROS"
bairro_centro1 = Bairro.find_or_create_by_nome(:nome => "Centro", :uf => "RJ", :cidade => cidade_dc)
bairro_centro2 = Bairro.find_or_create_by_nome(:nome => "Centro", :uf => "DF", :cidade => cidade_bs)

puts "CRIANDO PAÍSES"
pais_brasil = Pais.find_or_create_by_nome(:nome => "Brasil")
pais_eua = Pais.find_or_create_by_nome(:nome => "Estados Unidos")

puts "CRIANDO PROFISSÕES"
profissao_advogado = Profissao.find_or_create_by_nome(:nome => "Advogado")
profissao_contador = Profissao.find_or_create_by_nome(:nome => "Contador")

puts "CRIANDO ORIENTE ESTADUAL"
obediencia = OrienteEstadual.find_or_create_by_nome(:nome => "Grande Oriente do Estado do Rio de Janeiro", :email => "www.gob-rj.org.br", :sigla => "GO-RJ", :estado => estado_rj, :cidade => cidade_dc, :bairro => bairro_centro1)

puts "CRIANDO RITOS"
rito = Rito.find_or_create_by_nome(:nome => "Schoder")

puts "CRIANDO TEMPLOS"
templo = Templo.find_or_create_by_nome(:nome => "JPLSJ EQUIDADE", :endereco => "R. DO LAVRADIO, 97 - CP 91042", :cep => "20230-070", :estado => estado_rj, :cidade => cidade_dc, :bairro => bairro_centro1)
templo = Templo.find_or_create_by_nome(:nome => "Grande Oriente do Brasil", :endereco => "AV. W-5 Quadra 913 Conjunto H", :cep => "70390-130", :estado => estado_df, :cidade => cidade_bs, :bairro => bairro_centro2)

puts "CRIANDO CATEGORIAS"
irmao = Categoria.find_or_create_by_nome(:nome => "Irmão")
cunhada = Categoria.find_or_create_by_nome(:nome => "Cunhada")
sobrinha = Categoria.find_or_create_by_nome(:nome => "Sobrinha")

puts "CRIANDO GRAUS"
aprendiz = Grau.find_or_create_by_nome(:nome => "Aprendiz")
companheiro = Grau.find_or_create_by_nome(:nome => "Companheiro")
mestre = Grau.find_or_create_by_nome(:nome => "Mestre")

puts "CRIANDO TIPOS DE EVENTOS"
sessao = TipoEvento.find_or_create_by_nome(:nome => "Sessão")
evento_social = TipoEvento.find_or_create_by_nome(:nome => "Evento Social")
eventos_maconicos = TipoEvento.find_or_create_by_nome(:nome => "Eventos Maçônicos")

puts "CRIANDO VISIBILIDADES"
membros_da_loja = Visibilidade.find_or_create_by_nome(:nome => "Membros da Loja")
macons = Visibilidade.find_or_create_by_nome(:nome => "Maçons")

puts "CRIANDO USUÁRIOS"
user_master = User.find_or_create_by_email :name => "Master", :email => "master@gmail.com", :password => "123456", :password_confirmation => "123456", :confirmed_at => DateTime.now
user_master.add_role :admin_master

puts "CRIANDO PESSOAS"
pessoa_master = Pessoa.find_or_create_by_nome(:nome => "Master", :cpf => "13427701700", :email_particular => "master@gmail.com", :user_id => user_master.id, :grau_id => aprendiz.id)

puts "\n"