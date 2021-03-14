//Vending Machine starts with 6 candies and 10 chips

class VendingMachine
{
  int candyAmount;
  int chipAmount;
  float candyPrice;
  float chipPrice;
  float revenue;
 
  VendingMachine(int sCandy, int sChip, float cPrice, float chPrice)
  {
   candyAmount = sCandy;
   chipAmount = sChip;
   candyPrice = cPrice;
   chipPrice = chPrice;
   
   revenue = 0;
  }
  
  VendingMachine(int sCandy, int sChip)
  {
   candyAmount = sCandy;
   chipAmount = sChip;
   
   candyPrice = 1.25;
   chipPrice = 2.25;
   
   revenue = 0;
  }
  
  VendingMachine(float cPrice, float chPrice)
  {
  candyAmount = 6;
  chipAmount = 10;
  
   candyPrice = cPrice;
   chipPrice = chPrice;
   
   revenue = 0;
  }
  
  VendingMachine()
  {
  candyAmount = 6;
  chipAmount = 10;
   candyPrice = 1.25;
   chipPrice = 2.25;
  }
  
  void buy(String item)
  {
    if(item.toLowerCase() == "candy")
    {
      if(candyAmount > 0)
      {
      candyAmount--;
      addRevenue(getCandyPrice()); 
      }
      else
      {
       println("There are no more candies left in this vending machine."); 
      }
    }
    else if(item.toLowerCase() == "chip")
    {
      if(chipAmount > 0)
      {
        chipAmount--;
        addRevenue(getChipPrice());
        println("There are no more chips left in this vending machine.");
      }
    }
  }
  
  float getCandyAmount()
  {
    return candyAmount;
  }
  
  float getChipAmount()
  {
    return chipAmount; 
  }
  
  float getCandyPrice()
  {
    return candyPrice;
  }
  
  float getChipPrice()
  {
    return chipPrice; 
  }
  
  void addRevenue(float rev)
  {
    revenue += rev;
  }
  
  float getRevenue()
  {
   return revenue; 
  }
  
  void getStatus()
  {
    println("There are " + getCandyAmount() + " candies and " + getChipAmount() + 
    " chips left in the vending machine" + "\nThe Vending Machine has currently made $" + getRevenue());
  }
}

void setup()
{
  VendingMachine V1 = new VendingMachine();
  VendingMachine V2 = new VendingMachine(1, 5);
  V1.getStatus();
  V1.buy("candy");
  V1.getStatus();
  V1.buy("chip");
  
  V2.buy("candy");
  V2.getStatus();
}
