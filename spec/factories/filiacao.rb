FactoryGirl.define do
  factory :filiacao, :class => Filiacao do
    pessoa_id 1
    loja_id 1
    filiado_em Time.now
  end
end