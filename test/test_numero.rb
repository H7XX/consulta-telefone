# encoding: utf-8

require_relative 'setup'

describe 'Numero' do
	before do
		VCR.use_cassette('telefone') do
			@numero = ConsultaTelefone.new '7131172200'
		end
	end

	it 'Tipo' do
		@numero.tipo.must_equal 'Fixo'
	end

	it 'Portabilidade' do
		@numero.portabilidade.must_equal false
	end

	it 'Estado' do
		@numero.estado.must_equal 'Bahia (BA)'
	end

	it 'Região' do
		@numero.regiao.must_equal 'Salvador'
	end

	it 'Operadora' do
		@numero.operadora.must_equal 'Oi'
	end
	
end