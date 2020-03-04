#include<iostream>
using namespace std;

int main()
{
	int size;
	cout << "Enter the size of grammer: ";
	cin >> size;
	char a[size], alpha[size], b[size];
	int j=0, k=0;
	cout << "Enter the grammer: ";
	cin >> a;
	char check = a[0];
	alpha[j++] = a[0];
	alpha[j++] = '*';
	alpha[j++] = '-';
	alpha[j++] = '>';
	
	for(int i=3; a[i]!= '\0'; i++){
		if(a[i] == check){
			i++;
			while(a[i] != '|'){
				alpha[j++] = a[i];
				i++;
			}
		}
		else{
			b[k++] = a[0];
			b[k++] = '-';
			b[k++] = '>';
			b[k++] = a[i];
			b[k++] = a[0];
			b[k++] = '*';
			alpha[j++] = '^';
			break;
		}
		alpha[j++] = a[0];
		alpha[j++] = a[0];
		alpha[j++] = '|';
	}
		for(int z=0; z<k; z++){
			cout << b[z];
		}
		cout << endl;
		for(int z=0; z<k; z++){
			cout << alpha[z];
		}
	return 0;
}
