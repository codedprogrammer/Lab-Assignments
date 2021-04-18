void main() {
  
  //given number
  int num = 5;
  //initializing and declearing variable checker as true
  bool isPrime = true;
  
  //for loop to iterate through numbers from 2 to given number(num) and check if any number can divide the given number(num) to give 0.
  for(int i = 2; i < num; i++){
    //check if any number between 2 and the given number will divide the number to give 0.
    if(num % i == 0){
      isPrime = false;
      break;
    }
  }
  
  if(isPrime){
    print("Output: $num is a prime number");
  }else{
    print("Output: $num is not a prime number");
  }
  
  }
