programa
{
	inclua biblioteca Matematica --> mt
	inclua biblioteca Arquivos --> arq
	
	cadeia produtos[20]    
	real preco[20] = {21.50,120.00,9.90,14.90,29.9,14.00,4.90,55.90,16.10,21.90,34.80,99.00,14.90,54.90,29.90,19.90,26.90,34.90,69.90,49.90}
	real total = 0.0
	real comissao = 0.0
	inteiro codigoVendedor
	inteiro codigoProduto 
	

	
	funcao estoqueProdutos(){
		const cadeia CAMINHO = "./estoque.txt"
		se(arq.arquivo_existe(CAMINHO)){
			inteiro arquivo = arq.abrir_arquivo(CAMINHO, arq.MODO_LEITURA)
			cadeia linha
			para(inteiro i = 0; i < 20; i++){
				linha = arq.ler_linha(arquivo)
				se(linha == ""){
					pare
				}senao{
					produtos[i] = linha
			   	}
		
			}
			arq.fechar_arquivo(arquivo)
		}
		
	}
	funcao espere(){
		cadeia _
      	escreva("\n\nPressione enter para continuar a venda...")
  		leia(_)		
  	}
  	
	funcao iniciarVenda(){
		
		inteiro quantidadeProduto
		logico finalizar = falso
		
		escreva("Informe o código do vendedor:  \n\n1. Mylena Azevedo\t3. Clara Souza\n2. Felipe Costa\t        4. Não foi atentido por vendedor\n\n")
		leia(codigoVendedor)
		limpa()
		enquanto(nao finalizar){
			escreva("Digite o código do produto ou 0 para finalizar:  \n\n")
			leia(codigoProduto)
			limpa()	
			se(codigoProduto > 0 e codigoProduto <= 20){
				escreva("Digite a quantidade:  \n\n")
				leia(quantidadeProduto)
				limpa()
				escreva(quantidadeProduto +"X "+produtos[codigoProduto -1])
				espere()
				limpa()
				total += preco[codigoProduto - 1] * quantidadeProduto
				se(preco[codigoProduto - 1] < 19.90){
					comissao += preco[codigoProduto - 1] * quantidadeProduto * 0.10					
				}senao{
					comissao += preco[codigoProduto - 1] * quantidadeProduto * 0.15
					}
			}senao se(codigoProduto == 0){
				finalizar = verdadeiro
			}senao{
				escreva("Produto não cadastrado no sistema. Tente novamente... \n\n")
				espere()
				limpa()
			}
		}
		
	}
	
	funcao voltarInicio(){
		inteiro voltar
	 	escreva("\n\nPressione 0 para voltar...\n\n")
	 	leia(voltar)
		se(voltar == 0){
			limpa()
			inicio()			
		}
	}
	
	funcao consultarProdutos(){
		para(inteiro i = 0; i <= 19; i++){
		escreva(produtos[i] + "\n")
		}
		
		voltarInicio()
	}
	


		
	funcao inicio()
	{
		estoqueProdutos()
		inteiro opcao
		logico continuar = verdadeiro

		escreva("|    SISTEMA DE CAIXA INOVA PETS    |\n\n")
		escreva("Escolha uma opção para iniciar\n\n")
		escreva("1. Iniciar venda\t2. Consultar produtos\n3. Fechar caixa\n\n")
		leia(opcao)
		limpa()
		escolha(opcao){
		caso 1:
		iniciarVenda()
		pare
		caso 2:
		consultarProdutos()
		pare
		caso contrario:
		continuar = falso
		}
		limpa()
		escreva("=====================================","\n\n")
		escreva("            NF Inova Pets  ","\n\n")
		escreva("=====================================","\n")
		escreva("   Total a pagar   :   R$ "+mt.arredondar(total, 2),"\n")
		escreva("------------------------------------","\n")
			se(codigoVendedor != 4){
				escreva(" Comissão Vendas   :   R$ " +mt.arredondar(comissao, 2),"\n")
			}senao{
				escreva(" Não houve vendedor para esta venda.  ","\n")	
			}
		escreva("=====================================")
						
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 3152; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */