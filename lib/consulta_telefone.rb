require 'rubygems'
require 'httparty'
require 'nokogiri'

class ConsultaTelefone
	attr_reader :tipo, :portabilidade, :estado, :regiao, :operadora

	def initialize(numero)
		consulta = post_consultanumero(numero)
		dados = consulta.css('.resultado .b p')
		
		@tipo = clean_output(dados[0].text)
		@portabilidade = clean_output(dados[1].text) == 'Sim'
		@estado = clean_output(dados[2].text)
		@regiao = clean_output(dados[3].text)
		@operadora = consulta.css('.resultado .a img')[0]['alt']

	end

	private
	def parse(file)
		Nokogiri::HTML(file)
	end

	def clean_output(str)
			str[str.index("\u00BB") + 2, str.length]
	end

	def post_consultanumero(numero)
		parse(HTTParty.post('http://consultanumero.info/consulta', {
			:body => { :tel => numero },
			:headers => {
				'Content-Type' => 'application/x-www-form-urlencoded',
				'Content-Length' => '22',
				'User-Agent' => 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.90 Safari/537.36'
			}
		}).body)
	end
end