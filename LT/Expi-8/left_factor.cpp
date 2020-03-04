#include<iostream>
using namespace std;

int main()
{
	int size;
	cout << "Enter grammer size: ";
	cin >> size;
	char a[size], temp[size], A[size];
	int j=0, k=0, cnt=0, flag;
	cout << "Enter the grammer: ";
	cin >> a;
	char check = a[3];
	temp[j++] = a[0];
	temp[j++] = a[0];
	temp[j++] = '-';
	temp[j++] = '>';
	
	for(int i=3; a[i]!= '\0'; i++){
		if(a[i] == check){
			cnt++;
			i++;
			flag = 0;
			while(a[i] != '|' && a[i] != '\0'){
				temp[j++] = a[i];
				i++;
				flag=1;
			}
		}
		if(a[i] != '\0'){
			temp[j++] = a[i];
		}
		else if(a[i] == '\0' && flag == 0){
			temp[j++] = '^';
			break;
		}
		else{
			break;
		}
	}
	if(cnt > 1){
				A[k++] = a[0];
				A[k++] = '-';
				A[k++] = '>';
				A[k++] = check;
				A[k++] = a[0];
				A[k++] = a[0];
			}
		for(int z=0; z<k; z++){
			cout << A[z];
		}
		cout << endl;
		for(int z=0; z<k; z++){
			cout << temp[z];
		}
	return 0;
}
