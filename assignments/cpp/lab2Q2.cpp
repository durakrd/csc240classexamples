#include<iostream>
using namespace std;


int main()
{
    int num = 10;

    int *numPtr = &num;

    int &numRef = num;

    cout << "num = " << num << endl;
    cout << "Pointer to num = " << *numPtr << endl;
    cout << "Reference to num = " << numRef << endl;
    return 0;
}
