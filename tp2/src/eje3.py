import math
import os
import random
import re
import sys

def miniMaxSum(arr):
    maxSum = 0
    minSum = 0
    arrAuxiliar = []
    indx=0
    while indx < len(arr):
        suma = 0
        for j in range(0,len(arr)):  
            if(not indx == j ):
                suma+=arr[j]
        arrAuxiliar.append(suma)
        indx+=1
    minSum = min(arrAuxiliar)
    maxSum = max(arrAuxiliar)
    return minSum, maxSum

arr = list(map(int, input("Ingrese 5 números separados por espacios: ").split()))
print(miniMaxSum(arr))