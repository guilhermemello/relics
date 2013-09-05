FactoryGirl.define do
  factory :mary_pessoa, :class => Pessoa do
    user_id 1
    cpf "13427701788"
    nome "Mary Doe"
    categoria_id 1
    grau_id 1
    email_particular "mary.doe@gmail.com"
    data_nascimento Date.today
  end
end