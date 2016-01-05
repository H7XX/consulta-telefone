# encoding: utf-8

require_relative "lib/consulta_telefone"

numero = ConsultaTelefone.new '7131172200'

puts 'Tipo: ' + numero.tipo
puts 'Portabilidade: ' + numero.portabilidade.to_s
puts 'Estado: ' + numero.estado
puts 'Região: ' + numero.regiao
puts 'Operadora: ' + numero.operadora
