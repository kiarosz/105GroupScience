//Runge-Kutta de quarta ordem
//Citar o artigo Estudo do Universo de Friedmann partindo de conceitos newtonianos - Revista Brasileira de Ensino de Física
//Solução três componentes
//Contato patriciodcreis@gmail.com

//bibliotecas
#include <math.h>
#include <stdio.h>
#include <stdlib.h>

//parametros das equações
#define N 100000

FILE *input; //abre o arquivo de saída
FILE *input2; //abre o arquivo de saída
FILE *input3; //abre o arquivo de saída

//define as equações
double da(double t, double a);

int main(){
	//definição das variáveis
	int i;
	double a,t, h,hubble,rho,rhomat,rhorad,rhocos;
	double t0, a0;
	double ka1,ka2,ka3,ka4;

	input = fopen("sol.dat","wt"); //arquivo de saída
	input2 = fopen("hubble.dat","wt"); //arquivo de saída
	input3 = fopen("densidade.dat","wt"); //arquivo de saída
	
	//condições iniciais
	t0 = 0.0;
	a0 = 0.01;
	
	t = t0;
	a = a0;

	//passo
	h = 0.001;
	
	//inicio do integrador
	for(i=1;i<=N;i++){
		ka1 = da(t, a);
		ka2 = da(t + h/2.0,a + h*ka1/2.0);
		ka3 = da(t + h/2.0,a + h*ka2/2.0);
		ka4 = da(t + h,a + h*ka3);

		//solucoes
		a = a + h*(ka1 + 2.0*ka2 + 2.0*ka3 + ka4)/6.0;
		
		t = t + h;

		fprintf(input,"%.4f %.4f\n", t, a);
		
		//equacao de hubble
		hubble = ka1/a;
		
		fprintf(input2,"%.4f %.4f\n", t, hubble);
		
		//equacao da densidade
		rhorad = 1.0/pow(a,4);
		rhomat = 1.0/pow(a,3);
		rhocos = 1.0;
		rho = rhorad+rhomat+rhocos; //três componentes
		
		fprintf(input3,"%.4f %.4f %.4f %.4f\n", t, rho,rhorad,rhomat);
		}//fim do integrador

	fclose(input);
	fclose(input2);
	fclose(input3);
}

//equações diferenciais para serem resolvidas
double da(double t, double a){
	return(k*sqrt(1.0/(a*a) + 1.0/a + a*a));
	}
